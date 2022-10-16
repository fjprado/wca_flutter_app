import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:wca_flutter_app/app/pages/my_stickers/my_stickers_page.dart';
import 'package:wca_flutter_app/app/pages/my_stickers/presenter/my_stickers_presenter_impl.dart';
import 'package:wca_flutter_app/app/repository/stickers/stickers_repository_impl.dart';

import '../../repository/stickers/stickers_repository.dart';
import 'presenter/my_stickers_presenter.dart';

class MyStickersRoute extends FlutterGetItPageRoute {
  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<MyStickersPresenter>(
            (i) => MyStickersPresenterImpl(stickersRepository: i()))
      ];
  @override
  // TODO: implement page
  WidgetBuilder get page =>
      (context) => MyStickersPage(presenter: context.get());
}
