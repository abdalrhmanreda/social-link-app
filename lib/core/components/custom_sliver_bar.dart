import 'package:flutter/material.dart';
import 'package:social_link_app/ui/features/layout/components/profile_action_item.dart';

import 'custom_flexible_space.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.image,
    required this.height,
  });
  final String image;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: ProfileActionItem(),
        ),
      ],
      expandedHeight: height,
      automaticallyImplyLeading: true,
      flexibleSpace: CustomFlexibleSpaceBar(
        image: image,
      ),
    );
  }
}
