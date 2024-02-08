import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';

class CountLikesOrPost extends StatelessWidget {
  const CountLikesOrPost({
    super.key,
    required this.number,
    required this.text,
  });
  final String number;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 19.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 14.sp, color: const Color(AppColors.kGreyColor)),
        ),
      ],
    );
  }
}
