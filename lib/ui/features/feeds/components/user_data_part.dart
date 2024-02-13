import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:social_link_app/ui/features/authentication/controller/auth_cubit.dart';

import '../../../../config/colors/app_colors.dart';

class UserDataPart extends StatelessWidget {
  const UserDataPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18.r,
          backgroundColor: const Color(AppColors.kPrimaryColor),
          child: CircleAvatar(
            radius: 16.r,
            backgroundImage: CachedNetworkImageProvider(
                AuthCubit.get(context).userModel!.profileImage!),
          ),
        ),
        Gap(10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AuthCubit.get(context).userModel!.name!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15.sp,
                      ),
                ),
                Gap(5.w),
                const Icon(
                  Icons.check_circle,
                  color: Color(AppColors.kPrimaryColor),
                  size: 18,
                )
              ],
            ),
            Gap(2.h),
            Text(
              AuthCubit.get(context).userModel!.username!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 13.sp,
                    color: const Color(AppColors.kGreyColor),
                  ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.more_vert_sharp,
        ),
      ],
    );
  }
}
