import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_link_app/core/constant/strings.dart';
import 'package:social_link_app/ui/features/posts/model/post_model.dart';
import 'package:video_player/video_player.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  static PostCubit get(context) => BlocProvider.of(context);
  late VideoPlayerController controller;
  var postController = TextEditingController();

  File? postImage;
  File? postVideo;
  final picker = ImagePicker();
  Future<void> fetchPost({required bool isVideo}) async {
    if (isVideo) {
      final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
      if (pickedFile != null) {
        postVideo = File(pickedFile.path);
        controller = VideoPlayerController.file(File(postVideo!.path));
        await controller.initialize();
        emit(PickedPostVideoState());
      }
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        postImage = File(pickedFile.path);
        emit(PickedPostImageState());
      } else {
        emit(PostError());
        print('error');
      }
    }
  }

  void deletePost() {
    postImage = null;
    postVideo = null;
    controller.dispose();
    emit(DeletePostState());
  }

  void uploadImage({
    required String username,
    required String name,
    required String profileImage,
    required String time,
    required bool isVideo,
  }) {
    emit(PostLoading());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'posts/$userId/${Uri.file(isVideo ? postVideo!.path : postImage!.path).pathSegments.last}')
        .putFile(isVideo ? postVideo! : postImage!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        createPost(
          name: name,
          username: username,
          profileImage: profileImage,
          time: time,
          caption: postController.text ?? '',
          postImage: value,
        );
        postImage = null;
        emit(PostUploadImageSuccessState());
      });
    }).catchError((error) {
      emit(PostError());
    });
  }

  void addToAllPost(PostModel model) {
    emit(PostLoading());
    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toJson())
        .then((value) {
      emit(PostSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(PostError());
    });
  }

  void createPost({
    required String username,
    required String name,
    required String profileImage,
    String? postImage,
    String? caption,
    required String time,
  }) {
    PostModel model = PostModel(
      username: username,
      name: name,
      userId: userId,
      profileImage: profileImage,
      postImage: postImage ?? '',
      caption: caption ?? '',
      time: time,
    );
    emit(PostLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('posts')
        .add(model.toJson())
        .then((value) {
      addToAllPost(model);
      emit(PostSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(PostError());
    });
  }

  void dispose() {
    controller.dispose();
  }
}
