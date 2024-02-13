import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/cache/hive_cache.dart';
import '../../../../core/constant/strings.dart';
import '../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var usernameController = TextEditingController();
  String profileBlankImage =
      'https://img.freepik.com/free-vector/isolated-young-handsome-man-set-different-poses-white-background-illustration_632498-649.jpg?w=740&t=st=1707406336~exp=1707406936~hmac=9da05bc201714d21acbc0f6a462f22bdc59d34670ddce46b897d60c00093be05';

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      getUserData(userId: HiveCache.getData(key: 'userId'));
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  //
  void logout() {
    emit(LoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      emit(LogoutSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void userRegister() {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text)
        .then((value) {
      uploadImage(uId: value.user!.uid);

      HiveCache.saveData(key: 'userId', value: value.user!.uid.toString());
      userId = value.user!.uid;
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void createUser({
    required String email,
    required String name,
    required String phone,
    required String uId,
    required String address,
    required String username,
    required String profileImage,
    String? coverImage,
    String? bio,
  }) {
    UserModel userModel = UserModel(
      email: email,
      username: username,
      name: name,
      phone: phone,
      uId: uId,
      address: address,
      profileImage: profileImage,
      coverImage: profileBlankImage,
      bio: '',
    );
    emit(LoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toJson())
        .then((value) {
      getUserData(userId: uId);
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  UserModel? userModel;
  void getUserData({required String userId}) {
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);

      emit(GetUserDataSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  File? profilePhoto;
  final picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profilePhoto = File(pickedFile.path);
      emit(PickProfileImageSuccessState());
    } else {
      emit(FailureState(error: 'error'));
    }
  }

  void uploadImage({
    String? uId,
  }) {
    emit(LoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/$uId/${Uri.file(profilePhoto!.path).pathSegments.last}')
        .putFile(profilePhoto!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        createUser(
          email: emailController.text,
          name: nameController.text,
          phone: phoneController.text,
          uId: uId!,
          address: addressController.text,
          profileImage: value,
          username: usernameController.text,
        );
        profilePhoto = null;
        emit(UploadProfileImageSuccessState());
      });
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void updateProfileImage({
    String? uId,
  }) {
    emit(LoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/$uId/${Uri.file(profilePhoto!.path).pathSegments.last}')
        .putFile(profilePhoto!)
        .then((p0) {
      p0.ref.getDownloadURL().then((value) {
        updateUserData(profileImage: value);
        profilePhoto = null;
        emit(UploadProfileImageSuccessState());
      });
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void resetPassword({
    required String email,
  }) {
    emit(LoadingState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      emit(FailureState(error: error.toString()));
    });
  }

  void updateUserData({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? profileImage,
    String? coverImage,
    String? bio,
    String? uId,
  }) {
    UserModel model = UserModel(
      email: email ?? userModel!.email,
      name: name ?? userModel!.name,
      phone: phone ?? userModel!.phone,
      uId: uId ?? userModel!.uId,
      address: address ?? userModel!.address,
      profileImage: profileImage ?? userModel!.profileImage,
      coverImage: profileBlankImage ?? userModel!.coverImage,
      bio: bio ?? userModel!.bio,
    );

    emit(LoadingState());

    // Use set method instead of update
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .set(
            model.toJson(),
            SetOptions(
                merge: true)) // Use merge option to update without overwriting
        .then((value) {
      emit(UpdateUserDataSuccessState());
      getUserData(userId: userId!);
    }).catchError((error) {
      print(error.toString());
      emit(FailureState(error: error.toString()));
    });
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
}
