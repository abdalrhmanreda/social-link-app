import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/ui/features/authentication/components/register/full_name.dart';
import 'package:social_link_app/ui/features/profile/components/edit_profile/bio_text_form_feild.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.addressController,
    required this.bioController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController bioController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndTextFormFeild(
          nameController: nameController,
          title: 'Username',
          hint: 'username',
        ),
        Gap(15.h),
        TitleAndTextFormFeild(
          nameController: emailController,
          title: 'Email Address',
          hint: 'email address',
        ),
        Gap(15.h),
        TitleAndTextFormFeild(
          nameController: phoneController,
          title: 'phone',
          hint: 'phone',
        ),
        Gap(15.h),
        TitleAndTextFormFeild(
          nameController: addressController,
          title: 'Address',
          hint: 'address',
        ),
        Gap(15.h),
        BioTextFormFeild(
            isPass: false,
            controller: bioController,
            hint: 'Enter your bio',
            keyboardType: TextInputType.text),
      ],
    );
  }
}
