import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/ui/features/feeds/components/post_item.dart';

class Posts extends StatelessWidget {
  const Posts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const PostItem();
      },
      separatorBuilder: (context, index) => Gap(15.h),
      itemCount: 15,
    );
  }
}
