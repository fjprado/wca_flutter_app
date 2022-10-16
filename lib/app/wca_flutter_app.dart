import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:wca_flutter_app/app/core/rest/custom_dio.dart';
import 'package:wca_flutter_app/app/core/ui/global/global_context.dart';
import 'package:wca_flutter_app/app/core/ui/global/global_context_impl.dart';
import 'package:wca_flutter_app/app/core/ui/theme/theme_config.dart';
import 'package:wca_flutter_app/app/pages/auth/login/login_route.dart';
import 'package:wca_flutter_app/app/pages/auth/register/register_route.dart';
import 'package:wca_flutter_app/app/pages/home/home_route.dart';
import 'package:wca_flutter_app/app/pages/splash/splash_route.dart';
import 'package:wca_flutter_app/app/repository/auth/auth_repository.dart';
import 'package:wca_flutter_app/app/repository/auth/auth_repository_impl.dart';

class WcaFlutterApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  WcaFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>((i) =>
            GlobalContextImpl(navigatorKey: navigatorKey, authRepository: i()))
      ],
      child: MaterialApp(        
        title: 'World Cup Album',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => const HomeRoute(),
        },
      ),
    );
  }
}
