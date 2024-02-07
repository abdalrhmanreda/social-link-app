import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/l10n.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../../../core/components/progress_indector.dart';
import '../../../../core/constant/app_constant.dart';
import '../../controller/auth_cubit.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';
import '../common/sign_with_google.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetUserDataSuccessState) {
          // showToast(message: 'Login successfully', state: ToastState.SUCCESS);
          CustomNavigation.navigateByNamedTo(context, RoutePath.layout);
        } else if (state is FailureState) {
          // showToast(message: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppConstant.deviceHeight(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).loginScreenTitlePartOne,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        S.of(context).loginDesc,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              fontSize: 15.sp,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(30),
                      CustomTwoTextFromField(
                        firstController: emailController,
                        secondController: passController,
                        firstHint: S.of(context).loginScreenEmail,
                        secondHint: S.of(context).loginScreenPass,
                      ),
                      const Gap(15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          S.of(context).loginScreenForgetPass,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(AppColors.kGreyColor),
                                    fontSize: 14.sp,
                                  ),
                        ),
                      ),
                      const Gap(20),
                      ConditionalBuilder(
                          condition: state is! LoadingState,
                          builder: (context) => CustomButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passController.text);
                                  }
                                },
                                text: S.of(context).loginScreenButton,
                                height: 35.h,
                                color: AppColors.kPrimaryColor,
                                width: AppConstant.deviceWidth(context),
                                horizontal: 0,
                                vertical: 0,
                                radius: 10,
                                textColor: AppColors.kWhiteColor,
                                fontSize: 18.sp,
                              ),
                          fallback: (context) =>
                              const CustomLoadingIndicator()),
                      const Gap(25),
                      SignWithGoogle(text: S.of(context).signUpWithGoogle),
                      const Gap(20),
                      customTextNextToTextButton(
                        context: context,
                        text: S.of(context).loginScreenHaveNotAccount,
                        textButton: S.of(context).loginScreenCreateAccount,
                        onPressed: () {
                          CustomNavigation.navigateByNamedTo(
                              context, RoutePath.signUp);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
