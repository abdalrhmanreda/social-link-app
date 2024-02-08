import 'package:flutter/material.dart';
import 'package:social_link_app/config/routes/routes_path.dart';
import 'package:social_link_app/ui/features/authentication/screens/complete_profile_screen/complete_profile_screen.dart';
import 'package:social_link_app/ui/features/layout/screens/layout.dart';
import 'package:social_link_app/ui/features/posts/screens/posts.dart';
import 'package:social_link_app/ui/features/profile/screens/edit_profile.dart';
import 'package:social_link_app/ui/features/settings/screens/settings.dart';

import '../../ui/features/authentication/screens/login_screen/login_screen.dart';
import '../../ui/features/authentication/screens/register_screen/register_screen.dart';
import '../../ui/features/onboarding/screens/on_boarding_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.onBoarding:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case RoutePath.signUp:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case RoutePath.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case RoutePath.layout:
      return MaterialPageRoute(builder: (_) => const LayoutScreen());
    case RoutePath.postsScreen:
      return MaterialPageRoute(builder: (_) => const PostsScreen());
    case RoutePath.settingsScreen:
      return MaterialPageRoute(builder: (_) => const SettingsScreen());
    case RoutePath.editProfile:
      return MaterialPageRoute(builder: (_) => const EditProfileScreen());
    case RoutePath.completeProfile:
      return MaterialPageRoute(builder: (_) => const CompleteProfileScreen());
  }
  return null;
}
