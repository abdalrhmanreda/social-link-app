import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/core/components/flutter_toast.dart';
import 'package:social_link_app/core/constant/app_constant.dart';
import 'package:social_link_app/generated/assets.dart';
import 'package:social_link_app/ui/features/authentication/controller/auth_cubit.dart';
import 'package:toastification/toastification.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/components/custom_button.dart';
import '../../components/register/full_name.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showNotificationToast(
            context: context,
            message:
                'we have sent you an email to your email ${emailController.text}',
            title: 'Email Sent Successfully',
            style: ToastificationStyle.minimal,
            icon: IconlyBroken.message,
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              SvgPicture.asset(
                Assets.iconsRestPass,
                width: AppConstant.deviceWidth(context),
                height: AppConstant.deviceHeight(context) / 2,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TitleAndTextFormFeild(
                  nameController: emailController,
                  title: 'Enter your email',
                  hint: 'example@ex.com',
                ),
              ),
              const Gap(20),
              CustomButton(
                onPressed: () {
                  AuthCubit.get(context)
                      .resetPassword(email: emailController.text);
                },
                text: 'Reset Password',
                height: 35.h,
                color: AppColors.kPrimaryColor,
                width: AppConstant.deviceWidth(context),
                horizontal: 15.w,
                vertical: 15.h,
                radius: 10.r,
                textColor: AppColors.kWhiteColor,
                fontSize: 16.sp,
              ),
            ],
          ),
        );
      },
    );
  }
}
