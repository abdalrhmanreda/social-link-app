import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:photo_view/photo_view.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/components/custom_app_bar.dart';
import 'package:social_link_app/core/constant/app_constant.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: AppColors.kBlackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.arrow_left_outline,
            color: Color(AppColors.kWhiteColor),
          ),
        ),
      ),
      body: Stack(
        children: [
          PhotoView(
            imageProvider: CachedNetworkImageProvider(image),
            controller: PhotoViewController(
              initialPosition: Offset.zero,
            ),
            basePosition: Alignment.center,
            customSize: Size(AppConstant.deviceWidth(context),
                AppConstant.deviceHeight(context) / 2),
            minScale: .1,
          ),
        ],
      ),
    );
  }
}
