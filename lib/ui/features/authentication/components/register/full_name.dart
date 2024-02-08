import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../common/container_with_text_from_feild.dart';

class TitleAndTextFormFeild extends StatelessWidget {
  TitleAndTextFormFeild({
    super.key,
    required this.nameController,
    required this.title,
    required this.hint,
    this.suffixPressed,
    this.suffixIcon,
  });

  final TextEditingController nameController;
  final String title;
  final String hint;
  IconData? suffixIcon;
  VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15.sp),
        ),
        const Gap(10),
        ContainerTextFormFeild(
          isPass: false,
          suffixIcon: suffixIcon,
          suffixPressed: suffixPressed,
          controller: nameController,
          hint: hint,
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }
}
