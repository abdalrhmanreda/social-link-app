import 'package:flutter/material.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/components/custom_app_bar.dart';

import '../components/on_boarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        color: AppColors.konBoardingAppBarColor,
      ),
      body: OnBoardingScreenBody(),
    );
  }
}
