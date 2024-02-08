import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/config/routes/routes_path.dart';
import 'package:social_link_app/core/components/custom_navigatation.dart';

import '../../../../config/colors/app_colors.dart';

class ProfileActionItem extends StatelessWidget {
  const ProfileActionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        CustomNavigation.navigateByNamedTo(context, RoutePath.settingsScreen);
      },
      child: CircleAvatar(
        radius: 18.r,
        backgroundColor: const Color(AppColors.kWhiteColor),
        child: const Icon(
          Iconsax.setting_2_outline,
          color: Color(AppColors.kGreyColor),
          size: 23,
        ),
      ),
    );
  }
}
