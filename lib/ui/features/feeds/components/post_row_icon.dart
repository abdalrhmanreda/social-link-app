import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:icons_plus/icons_plus.dart';

class PostIconRow extends StatelessWidget {
  final VoidCallback onHeartPressed;
  final VoidCallback onMessagePressed;
  final VoidCallback onSendPressed;
  final VoidCallback onBookmarkPressed;

  const PostIconRow({
    super.key,
    required this.onHeartPressed,
    required this.onMessagePressed,
    required this.onSendPressed,
    required this.onBookmarkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onHeartPressed,
          icon: const Icon(Iconsax.heart_outline),
        ),
        IconButton(
          onPressed: onMessagePressed,
          icon: const Icon(IconlyBroken.message),
        ),
        Transform.rotate(
          angle: -.7,
          child: IconButton(
            onPressed: onSendPressed,
            icon: const Icon(Iconsax.send_1_outline),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: onBookmarkPressed,
          icon: const Icon(IconlyBroken.bookmark),
        ),
      ],
    );
  }
}
