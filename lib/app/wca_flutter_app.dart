import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/theme/theme_config.dart';

import 'pages/splash/splash_page.dart';

class WcaFlutterApp extends StatelessWidget {
  const WcaFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Cup Album',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {
        '/': (_) => const SplashPage(),
      },
    );
  }
}
