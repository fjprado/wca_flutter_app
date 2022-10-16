import '../../../core/mvp/wca_presenter.dart';
import 'splash_presenter_impl.dart';

abstract class SplashPresenter extends WcaPresenter {
  SplashPresenter(SplashPresenterImpl Function(dynamic i) param0);

  Future<void> checkLogin();
}
