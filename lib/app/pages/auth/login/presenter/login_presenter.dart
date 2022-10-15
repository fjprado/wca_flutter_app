import 'package:wca_flutter_app/app/core/mvp/wca_presenter.dart';
import 'package:wca_flutter_app/app/pages/auth/login/view/login_view.dart';

abstract class LoginPresenter extends WcaPresenter<LoginView> {
  Future<void> login(String email, String password);
}
