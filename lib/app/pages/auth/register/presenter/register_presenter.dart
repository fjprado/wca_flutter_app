import '../../../../core/mvp/wca_presenter.dart';
import '../view/register_view.dart';

abstract class RegisterPresenter extends WcaPresenter<RegisterView> {
  Future<void> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword});
}
