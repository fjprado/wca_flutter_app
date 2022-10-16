import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'presenter/register_presenter.dart';
import 'presenter/register_presenter_impl.dart';
import 'register_page.dart';

class RegisterRoute extends FlutterGetItPageRoute {
  const RegisterRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<RegisterPresenter>(
            (i) => RegisterPresenterImpl(authRepository: i()))
      ];

  @override
  WidgetBuilder get page => (context) => RegisterPage(presenter: context.get());
}
