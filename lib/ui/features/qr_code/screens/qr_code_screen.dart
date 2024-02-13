import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:social_link_app/core/components/custom_button.dart';
import 'package:social_link_app/core/components/custom_outline_button.dart';
import 'package:social_link_app/core/constant/app_constant.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_app_bar.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key, required this.uId});
  final String uId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColors.kPrimaryColor),
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Iconsax.arrow_left_outline,
            color: Color(AppColors.kWhiteColor),
          ),
        ),
        title: Text(
          'Qr Code',
          style: TextStyle(
              color: const Color(AppColors.kWhiteColor), fontSize: 17.sp),
        ),
        isCenter: true,
        color: AppColors.kPrimaryColor,
      ),
      body: Column(
        children: [
          const Spacer(flex: 1),
          Column(
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: QrImageView(
                  data: uId,
                  version: QrVersions.auto,
                  size: AppConstant.deviceHeight(context) / 3.5,
                  backgroundColor: const Color(AppColors.kWhiteColor),
                ),
              ),
              Gap(10.h),
              Text(
                '@$uId',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(AppColors.kWhiteColor)),
              ),
            ],
          ),
          const Spacer(flex: 2),
          Container(
            height: 60.h,
            width: AppConstant.deviceWidth(context),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color(AppColors.kWhiteColor),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: AppConstant.deviceWidth(context) / 2.5,
                    child:
                        CustomOutlineButton(text: 'Share', onPressed: () {})),
                CustomButton(
                  onPressed: () {},
                  text: 'copy link',
                  color: (AppColors.kPrimaryColor),
                  textColor: (AppColors.kWhiteColor),
                  radius: 20.r,
                  vertical: 0,
                  horizontal: 0,
                  width: AppConstant.deviceWidth(context) / 2.5,
                  height: 30.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
