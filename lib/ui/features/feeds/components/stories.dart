import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/ui/features/feeds/components/story_item.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../generated/assets.dart';

class Stories extends StatelessWidget {
  const Stories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return index == 0
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      const StoryItem(
                          username: 'You',
                          profileImage: Assets.storyPhoto1707436314,
                          storyImage: Assets.storyFlutter),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Iconsax.add_outline,
                            color: Color(AppColors.kWhiteColor),
                            size: 35,
                          ))
                    ],
                  )
                : const StoryItem(
                    username: 'Eyad Reda',
                    profileImage: Assets.storyAbdo,
                    storyImage: Assets.storyCat);
          },
          separatorBuilder: (context, index) => Gap(10.w),
          itemCount: 10,
        ),
      ),
    );
  }
}
