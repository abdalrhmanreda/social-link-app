import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/components/custom_app_bar.dart';
import 'package:social_link_app/core/components/custom_text_button.dart';
import 'package:social_link_app/core/constant/app_constant.dart';
import 'package:social_link_app/ui/features/layout/components/profile_leading.dart';
import 'package:social_link_app/ui/features/posts/controller/post_cubit.dart';

import '../../../../core/methods/get_current_location/get_current_location.dart';
import '../../feeds/components/create_post_icons_row.dart';
import '../components/on_post_button_pressed.dart';

class CreatePostsScreen extends StatelessWidget {
  const CreatePostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            leading: const ProfileLeading(),
            color: AppColors.kWhiteColor,
            title: Text(
              'Create Post',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: const Color(AppColors.kBlackColor),
                  ),
            ),
            actions: [
              CustomTextButton(
                onPressed: () {
                  onPostButtonPressed(context);
                },
                text: 'Post',
                fontSize: 16.sp,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  maxLines: null,
                  controller: PostCubit.get(context).postController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What\'s on your mind?',
                  ),
                ),
                if (PostCubit.get(context).postImage != null)
                  Container(
                    height: AppConstant.deviceHeight(context) / 2.5,
                    width: AppConstant.deviceWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      image: DecorationImage(
                        image: FileImage(PostCubit.get(context).postImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                const Spacer(),
                IconButtonRow(
                  onImagePressed: () {
                    PostCubit.get(context).fetchPost(isVideo: false);
                  },
                  onVideoPressed: () {
                    PostCubit.get(context).fetchPost(isVideo: true);
                  },
                  onTagPressed: () {
                    // Your logic for handling tag button press
                  },
                  onLocationPressed: () {
                    GetCurrentLocation().getCurrentPosition();
                  },
                  onTrashPressed: () {
                    PostCubit.get(context).deletePost();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
