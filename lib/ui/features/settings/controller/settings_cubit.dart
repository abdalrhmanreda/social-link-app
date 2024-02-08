import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:social_link_app/ui/features/authentication/controller/auth_cubit.dart';

import '../models/settings_model.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);

  List<SettingsModel> settings(context) => [
        SettingsModel(
          title: 'Manage Account',
          icon: IconlyBroken.profile,
          onTap: () {},
        ),
        SettingsModel(
            title: 'QR Code', icon: Iconsax.code_circle_outline, onTap: () {}),
        SettingsModel(
            title: 'Saved', icon: Iconsax.bookmark_outline, onTap: () {}),
        SettingsModel(
            title: 'Notifications',
            icon: IconlyBroken.notification,
            onTap: () {}),
        SettingsModel(
            title: 'Password Manager', icon: Iconsax.key_outline, onTap: () {}),
        SettingsModel(title: 'Help & Support', icon: Icons.help, onTap: () {}),
        SettingsModel(
            title: 'Invite Friends',
            icon: Iconsax.user_add_outline,
            onTap: () {}),
        SettingsModel(
            title: 'Logout',
            icon: Iconsax.logout_1_outline,
            onTap: () {
              AuthCubit.get(context).logout();
            }),
      ];
}
