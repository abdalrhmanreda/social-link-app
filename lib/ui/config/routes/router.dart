import 'package:flutter/material.dart';
import 'package:social_link_app/ui/config/routes/routes_path.dart';

import '../../features/authentication/screens/login_screen/login_screen.dart';
import '../../features/authentication/screens/register_screen/register_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.signUp:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case RoutePath.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
  }
}
