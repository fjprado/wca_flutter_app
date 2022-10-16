// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import '../../../../core/exceptions/unauthorized_exception.dart';
import '../../../../services/login/login_service.dart';
import '../view/login_view.dart';
import './login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService loginService;
  late final LoginView _view;

  LoginPresenterImpl({
    required this.loginService,
  });

  @override
  Future<void> login(String email, String password) async {
    try {
      await loginService.execute(email: email, password: password);
      _view.success();
    } on UnauthorizedException catch (e) {
      _view.error('Invalid user or password');
    } catch (e, s) {
      log('Error while login process', error: e, stackTrace: s);
      _view.error('Error while login process');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
