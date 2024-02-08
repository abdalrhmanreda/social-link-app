import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/colors/app_colors.dart';

class ProfileImageDialog extends StatelessWidget {
  const ProfileImageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'if you want to complete profile you have to upload your profile',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 15.sp,
            ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'OK',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15.sp, color: const Color(AppColors.kPrimaryColor)),
          ),
        ),
      ],
    );
  }
}
