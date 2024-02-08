import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/config/routes/routes_path.dart';
import 'package:social_link_app/core/components/custom_navigatation.dart';

import '../../../../config/colors/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: FloatingActionButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        onPressed: () {
          CustomNavigation.navigateByNamedTo(context, RoutePath.postsScreen);
        },
        shape: const CircleBorder(),
        backgroundColor: const Color(AppColors.kPrimaryColor),
        child: const Icon(
          Iconsax.add_outline,
          color: Color(AppColors.kWhiteColor),
        ),
      ),
    );
  }
}
