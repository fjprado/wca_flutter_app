import '../../../../core/mvp/wca_presenter.dart';
import '../view/login_view.dart';

abstract class LoginPresenter extends WcaPresenter<LoginView> {
  Future<void> login(String email, String password);
}
