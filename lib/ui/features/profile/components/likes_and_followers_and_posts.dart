import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/core/components/custom_divider.dart';
import 'package:social_link_app/ui/features/profile/models/counter_model.dart';

import '../components/count_likes.dart';

class LikesAndPostsAndFollowers extends StatelessWidget {
  const LikesAndPostsAndFollowers({
    super.key,
    required this.counts,
  });

  final List<CounterModel> counts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int index = 0; index < counts.length; index++)
            Row(
              children: [
                CountLikesOrPost(
                  number: counts[index].count.toInt().toString(),
                  text: counts[index].textWantCount,
                ),
                if (index != counts.length - 1) Gap(10.w),
                if (index != counts.length - 1) myDivider(1.h, 40.h),
              ],
            ),
        ],
      ),
    );
  }
}
