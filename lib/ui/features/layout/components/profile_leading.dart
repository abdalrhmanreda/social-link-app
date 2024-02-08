import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';

class ProfileLeading extends StatelessWidget {
  const ProfileLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 15.r,
        backgroundColor: const Color(AppColors.kWhiteColor),
        child: const Icon(
          Iconsax.arrow_left_outline,
          color: Color(AppColors.kGreyColor),
        ),
      ),
    );
  }
}
