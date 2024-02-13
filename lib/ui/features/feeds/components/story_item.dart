import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/config/colors/app_colors.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.username,
    required this.profileImage,
    required this.storyImage,
  });
  final String username;
  final String profileImage;
  final String storyImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 135.w,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 150.h,
            width: 135.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              image: DecorationImage(
                image: AssetImage(storyImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18.r,
                  backgroundColor: const Color(AppColors.kPrimaryColor),
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundImage: AssetImage(profileImage),
                  ),
                ),
                Gap(10.w),
                Text(
                  username,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: const Color(AppColors.kWhiteColor),
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
