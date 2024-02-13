import 'package:flutter/material.dart';

import '../../../../core/methods/format_time/format_time.dart';
import '../../authentication/controller/auth_cubit.dart';
import '../controller/post_cubit.dart';

void onPostButtonPressed(context) {
  if (PostCubit.get(context).postImage != null) {
    PostCubit.get(context).uploadImage(
        username: AuthCubit.get(context).userModel!.username!,
        name: AuthCubit.get(context).userModel!.name!,
        profileImage: AuthCubit.get(context).userModel!.profileImage!,
        time: formatTime(TimeOfDay.now()),
        isVideo: false);
  } else if (PostCubit.get(context).postVideo != null) {
    PostCubit.get(context).uploadImage(
      username: AuthCubit.get(context).userModel!.username!,
      name: AuthCubit.get(context).userModel!.name!,
      profileImage: AuthCubit.get(context).userModel!.profileImage!,
      time: formatTime(TimeOfDay.now()),
      isVideo: true,
    );
  } else {
    PostCubit.get(context).createPost(
      name: AuthCubit.get(context).userModel!.name!,
      username: AuthCubit.get(context).userModel!.username!,
      profileImage: AuthCubit.get(context).userModel!.profileImage!,
      time: formatTime(TimeOfDay.now()),
    );
  }
}
