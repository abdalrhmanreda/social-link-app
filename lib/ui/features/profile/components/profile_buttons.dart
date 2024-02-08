import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/config/routes/routes_path.dart';
import 'package:social_link_app/core/components/custom_navigatation.dart';
import 'package:social_link_app/generated/assets.dart';

import '../components/custom_profile_button.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomProfileButton(
          text: 'Edit Profile',
          onTap: () {
            CustomNavigation.navigateByNamedTo(context, RoutePath.editProfile);
          },
          icon: const Icon(
            Iconsax.edit_2_outline,
            color: Color(AppColors.kWhiteColor),
          ),
          isQr: false,
        ),
        CustomProfileButton(
          onTap: () {},
          text: 'QR-Code',
          icon: const ImageIcon(
            AssetImage(Assets.iconsQr),
            color: Color(AppColors.kPrimaryColor),
          ),
          isQr: true,
        ),
      ],
    );
  }
}
