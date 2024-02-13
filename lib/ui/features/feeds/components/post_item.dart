import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/ui/features/feeds/components/post_row_icon.dart';
import 'package:social_link_app/ui/features/feeds/components/user_data_part.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../generated/assets.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstant.deviceHeight(context) / 2,
      width: AppConstant.deviceWidth(context),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserDataPart(),
          Gap(10.h),
          Text('There is a new story',
              style: Theme.of(context).textTheme.bodyMedium),
          Gap(10.h),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: const DecorationImage(
                  image: AssetImage(Assets.storyCat),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Gap(5.h),
          PostIconRow(
            onHeartPressed: () {
              // Handle heart button pressed
            },
            onMessagePressed: () {
              // Handle message button pressed
            },
            onSendPressed: () {
              // Handle send button pressed
            },
            onBookmarkPressed: () {
              // Handle bookmark button pressed
            },
          )
        ],
      ),
    );
  }
}
