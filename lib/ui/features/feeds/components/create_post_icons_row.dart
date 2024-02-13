import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';

class IconButtonRow extends StatelessWidget {
  final VoidCallback onImagePressed;
  final VoidCallback onVideoPressed;
  final VoidCallback onTagPressed;
  final VoidCallback onLocationPressed;
  final VoidCallback onTrashPressed;

  const IconButtonRow({
    super.key,
    required this.onImagePressed,
    required this.onVideoPressed,
    required this.onTagPressed,
    required this.onLocationPressed,
    required this.onTrashPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconButton(Icons.image, onImagePressed),
        buildIconButton(Iconsax.video_square_outline, onVideoPressed),
        buildIconButton(Iconsax.tag_2_outline, onTagPressed),
        buildIconButton(Iconsax.location_outline, onLocationPressed),
        const Spacer(),
        buildIconButton(Iconsax.trash_outline, onTrashPressed),
      ],
    );
  }

  Widget buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: const Color(AppColors.kPrimaryColor),
      ),
    );
  }
}
