import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_link_app/ui/features/profile/screens/image_view.dart';

import '../../../../core/components/custom_navigatation.dart';

class ProfileImages extends StatelessWidget {
  const ProfileImages({
    super.key,
    required this.profile,
  });

  final String profile;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: InkWell(
        onTap: () {
          CustomNavigation.navigateTo(
              context,
              ImageViewScreen(
                image: profile,
              ));
        },
        child: CircleAvatar(
          radius: 64.r,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(profile),
            radius: 60.0.r,
          ),
        ),
      ),
    );
  }
}
