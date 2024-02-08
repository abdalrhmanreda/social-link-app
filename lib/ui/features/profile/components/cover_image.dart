import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/constant/app_constant.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: AppConstant.deviceWidth(context),
          height: AppConstant.deviceHeight(context) / 3.3,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: AppConstant.deviceHeight(context) / 3.6,
          left: 0,
          right: 0,
          child: Container(
            height: 25.h,
            width: AppConstant.deviceWidth(context),
            decoration: ShapeDecoration(
              color: const Color(AppColors.kWhiteColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
