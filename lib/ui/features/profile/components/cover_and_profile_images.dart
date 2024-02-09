import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/constant/app_constant.dart';
import 'package:social_link_app/ui/features/layout/components/profile_action_item.dart';

import '../components/cover_image.dart';

class CoverAndProfileImages extends StatelessWidget {
  const CoverAndProfileImages({
    super.key,
    required this.cover,
    required this.profile,
  });

  final String cover;
  final String profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstant.deviceHeight(context) / 2.9,
      width: AppConstant.deviceWidth(context),
      color: const Color(AppColors.kWhiteColor),
      child: Stack(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              CoverImage(image: cover),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProfileActionItem(),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircleAvatar(
              radius: 64.r,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(profile),
                radius: 60.0.r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
