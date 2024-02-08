import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/colors/app_colors.dart';

class NameAndBio extends StatelessWidget {
  const NameAndBio({
    super.key,
    required this.name,
    required this.bio,
  });
  final String name;
  final String bio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        Gap(5.h),
        Text(
          bio,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13.sp,
                color: const Color(AppColors.kGreyColor),
              ),
        ),
      ],
    );
  }
}
