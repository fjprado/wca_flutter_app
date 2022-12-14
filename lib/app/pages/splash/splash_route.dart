import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'presenter/splash_presenter.dart';
import 'presenter/splash_presenter_impl.dart';
import 'splash_page.dart';

class SplashRoute extends FlutterGetItPageRoute {
  const SplashRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<SplashPresenter>((i) => SplashPresenterImpl()),
      ];

  @override
  // TODO: implement page
  WidgetBuilder get page => (context) => SplashPage(presenter: context.get());
}
