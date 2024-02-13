import 'package:flutter/material.dart';
import 'package:social_link_app/ui/features/feeds/components/posts.dart';
import 'package:social_link_app/ui/features/feeds/components/stories.dart';

class FeedsScreenBody extends StatelessWidget {
  const FeedsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Stories(),
          Posts(),
        ],
      ),
    );
  }
}
