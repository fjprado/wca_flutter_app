import 'package:wca_flutter_app/app/core/mvp/wca_presenter.dart';
import 'package:wca_flutter_app/app/pages/splash/presenter/splash_presenter_impl.dart';

abstract class SplashPresenter extends WcaPresenter {
  SplashPresenter(SplashPresenterImpl Function(dynamic i) param0);

  Future<void> checkLogin();
}
