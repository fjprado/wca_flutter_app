import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:wca_flutter_app/app/core/rest/custom_dio.dart';
import 'package:wca_flutter_app/app/core/ui/theme/theme_config.dart';
import 'package:wca_flutter_app/app/pages/auth/login/login_page.dart';
import 'package:wca_flutter_app/app/pages/home/home_page.dart';
import 'package:wca_flutter_app/app/pages/splash/splash_route.dart';

class WcaFlutterApp extends StatelessWidget {
  const WcaFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () =>
          [Bind.lazySingleton<CustomDio>((i) => CustomDio())],
      child: MaterialApp(
        title: 'World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
