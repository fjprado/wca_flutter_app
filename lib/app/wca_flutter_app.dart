import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:wca_flutter_app/app/pages/my_stickers/my_stickers_route.dart';
import 'package:wca_flutter_app/app/pages/sticker_detail/sticker_detail_route.dart';
import '../app/core/rest/custom_dio.dart';
import '../app/core/ui/global/global_context.dart';
import '../app/core/ui/global/global_context_impl.dart';
import '../app/core/ui/theme/theme_config.dart';
import '../app/pages/auth/login/login_route.dart';
import '../app/pages/auth/register/register_route.dart';
import '../app/pages/home/home_route.dart';
import '../app/pages/splash/splash_route.dart';
import '../app/repository/auth/auth_repository.dart';
import '../app/repository/auth/auth_repository_impl.dart';

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
          '/my-stickers': (_) => const MyStickersRoute(),
          '/sticker-detail': (_) => const StickerDetailRoute(),
        },
      ),
    );
  }
}
