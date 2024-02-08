import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../generated/assets.dart';

class FeedLeading extends StatelessWidget {
  const FeedLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.iconsLogo,
          height: 35.h,
          width: 35.w,
          fit: BoxFit.cover,
        ),
        Gap(5.w),
        Text(
          'Social',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
