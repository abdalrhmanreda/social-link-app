import 'package:flutter/material.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/components/custom_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text('Your Profile'),
        color: AppColors.kWhiteColor,
        isCenter: true,
      ),
      body: Container(),
    );
  }
}
