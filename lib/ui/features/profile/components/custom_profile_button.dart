import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_link_app/config/colors/app_colors.dart';

import '../../../../core/constant/app_constant.dart';

class CustomProfileButton extends StatelessWidget {
  const CustomProfileButton({
    super.key,
    required this.text,
    required this.icon,
    required this.isQr,
    required this.onTap,
  });
  final String text;
  final Widget icon;
  final bool isQr;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('object');
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        width: AppConstant.deviceWidth(context) / 2.2,
        height: 36.h,
        decoration: isQr
            ? BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  color: const Color(AppColors.kPrimaryColor),
                ),
                borderRadius: BorderRadius.circular(15.r),
              )
            : BoxDecoration(
                color: const Color(AppColors.kPrimaryColor),
                borderRadius: BorderRadius.circular(15.r),
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: isQr
                        ? const Color(AppColors.kPrimaryColor)
                        : Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
