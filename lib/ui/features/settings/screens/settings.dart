import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/config/colors/app_colors.dart';
import 'package:social_link_app/core/components/custom_app_bar.dart';
import 'package:social_link_app/ui/features/settings/controller/settings_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: Text('Settings'),
            color: AppColors.kWhiteColor,
          ),
          body: ListView(
            children: SettingsCubit.get(context)
                .settings(context)
                .map(
                  (e) => ListTile(
                    leading: Icon(
                      e.icon,
                      color: const Color(AppColors.kPrimaryColor),
                    ),
                    title: Text(e.title),
                    onTap: e.onTap,
                    trailing: const Icon(
                      Iconsax.arrow_right_3_outline,
                      color: Color(AppColors.kPrimaryColor),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
