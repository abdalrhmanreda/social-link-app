import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/components/custom_app_bar.dart';
import 'package:social_link_app/core/components/custom_button.dart';
import 'package:social_link_app/core/components/flutter_toast.dart';
import 'package:social_link_app/core/components/progress_indector.dart';
import 'package:social_link_app/core/constant/app_constant.dart';
import 'package:social_link_app/ui/features/layout/components/profile_leading.dart';
import 'package:toastification/toastification.dart';

import '../../authentication/controller/auth_cubit.dart';
import '../components/edit_profile/edit_profile_image.dart';
import '../components/edit_profile/user_data.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController bioController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    bioController = TextEditingController();

    // Initialize the controllers with the current user data
    nameController.text = AuthCubit.get(context).userModel!.name!;
    emailController.text = AuthCubit.get(context).userModel!.email!;
    phoneController.text = AuthCubit.get(context).userModel!.phone!;
    addressController.text = AuthCubit.get(context).userModel!.address!;
    bioController.text = AuthCubit.get(context).userModel!.bio!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UpdateUserDataSuccessState) {
          showNotificationToast(
            context: context,
            message: 'you have successfully updated your profile',
            title: 'Profile Updated Successfully',
            style: ToastificationStyle.minimal,
            icon: Icons.done,
          );
        } else if (state is FailureState) {
          showNotificationToast(
              context: context,
              message: 'Something went wrong, please try again',
              title: 'Something went wrong, please try again',
              style: ToastificationStyle.minimal);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            leading: ProfileLeading(),
            title: Text('Your Profile'),
            color: AppColors.kWhiteColor,
            isCenter: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const EditProfileImage(),
                        Gap(15.h),
                        UserData(
                          nameController: nameController,
                          emailController: emailController,
                          phoneController: phoneController,
                          addressController: addressController,
                          bioController: bioController,
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(15.h),
                ConditionalBuilder(
                    condition: state is! LoadingState,
                    builder: (context) => CustomButton(
                          text: 'Update Profile',
                          onPressed: () {
                            if (AuthCubit.get(context).profilePhoto != null) {
                              AuthCubit.get(context).updateProfileImage();
                            } else {
                              AuthCubit.get(context).updateUserData(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                address: addressController.text,
                                bio: bioController.text,
                              );
                            }
                          },
                          color: AppColors.kPrimaryColor,
                          textColor: AppColors.kWhiteColor,
                          radius: 10.r,
                          height: 40.h,
                          width: AppConstant.deviceWidth(context),
                          vertical: 10.h,
                          horizontal: 0,
                          fontSize: 16.sp,
                        ),
                    fallback: (context) => const CustomLoadingIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}
