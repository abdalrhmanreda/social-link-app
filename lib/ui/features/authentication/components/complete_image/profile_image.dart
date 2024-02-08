import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/ui/features/authentication/controller/auth_cubit.dart';

import '../../../../../config/colors/app_colors.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 65.r,
              backgroundColor: const Color(AppColors.konBoardingAppBarColor),
              backgroundImage: AuthCubit.get(context).profilePhoto != null
                  ? Image.file(AuthCubit.get(context).profilePhoto!).image
                  : CachedNetworkImageProvider(
                      AuthCubit.get(context).profileBlankImage),
            ),
            CircleAvatar(
              backgroundColor: const Color(AppColors.kPrimaryColor),
              child: IconButton(
                onPressed: () {
                  AuthCubit.get(context).getProfileImage();
                },
                icon: const Icon(
                  Iconsax.camera_outline,
                  color: Color(AppColors.kWhiteColor),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
