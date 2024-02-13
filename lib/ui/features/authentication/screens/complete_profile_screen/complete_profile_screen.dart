import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/components/custom_button.dart';
import 'package:social_link_app/core/components/progress_indector.dart';
import 'package:social_link_app/core/constant/app_constant.dart';
import 'package:social_link_app/core/methods/get_current_location/get_current_location.dart';
import 'package:social_link_app/ui/features/authentication/controller/auth_cubit.dart';

import '../../components/complete_image/profile_image.dart';
import '../../components/complete_image/profile_image_dialog.dart';
import '../../components/register/full_name.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Complete Profile',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Gap(5.h),
                  Text(
                    'Don\'t Worry. only you can see your personal information , No one else will be able to see it',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const Gap(30),
                  const ProfileImage(),
                  Gap(15.h),
                  TitleAndTextFormFeild(
                    title: 'Your Address',
                    nameController: AuthCubit.get(context).addressController,
                    suffixIcon: Iconsax.location_outline,
                    suffixPressed: () async {
                      AuthCubit.get(context).addressController.text =
                          (await GetCurrentLocation().getCurrentAddress());
                    },
                    hint: 'your address',
                  ),
                  Gap(10.h),
                  TitleAndTextFormFeild(
                    title: 'username',
                    nameController: AuthCubit.get(context).usernameController,
                    hint: 'abdalrhman2024',
                  ),
                  Gap(15.h),
                  ConditionalBuilder(
                      condition: state is! LoadingState,
                      builder: (context) => CustomButton(
                            onPressed: () {
                              if (AuthCubit.get(context).profilePhoto == null) {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const ProfileImageDialog(),
                                );
                              } else {
                                AuthCubit.get(context).userRegister();
                              }
                            },
                            text: 'Complete Profile',
                            radius: 10.r,
                            color: AppColors.kPrimaryColor,
                            textColor: AppColors.kWhiteColor,
                            horizontal: 0.w,
                            vertical: 15.h,
                            height: 37.h,
                            width: AppConstant.deviceWidth(context),
                          ),
                      fallback: (context) => const CustomLoadingIndicator()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
