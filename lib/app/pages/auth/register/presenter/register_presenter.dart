import 'package:wca_flutter_app/app/core/mvp/wca_presenter.dart';
import 'package:wca_flutter_app/app/pages/auth/register/view/register_view.dart';

abstract class RegisterPresenter extends WcaPresenter<RegisterView> {
  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword});
}
