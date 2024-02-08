import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:social_link_app/ui/features/authentication/controller/auth_cubit.dart';
import 'package:social_link_app/ui/features/layout/controller/layout_cubit.dart';
import 'package:social_link_app/ui/features/settings/controller/settings_cubit.dart';

import 'config/routes/router.dart';
import 'config/routes/routes_path.dart';
import 'config/themes/themes.dart';
import 'core/cache/hive_cache.dart';
import 'core/observer/blocObserver.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  await HiveCache.openHive();
  runApp(const LinkApp());
}

class LinkApp extends StatelessWidget {
  const LinkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => LayoutCubit()),
            BlocProvider(create: (context) => SettingsCubit()),
          ],
          child: SafeArea(
            child: MaterialApp(
              initialRoute: RoutePath.layout,
              onGenerateRoute: generateRoute,
              locale: const Locale('en', 'US'),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              theme: Style.lightTheme,
              darkTheme: Style.darkTheme,
              themeMode: ThemeMode.light,
            ),
          ),
        );
      },
    );
  }
}
