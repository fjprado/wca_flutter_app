import 'dart:developer';

import '../../../../models/register_user_model.dart';
import '../../../../repository/auth/auth_repository.dart';
import '../view/register_view.dart';
import './register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  final AuthRepository authRepository;
  late RegisterView _view;

  RegisterPresenterImpl({required this.authRepository});

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final registerUserModel = RegisterUserModel(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword);

    try {
      await authRepository.register(registerUserModel);
      _view.registerSuccess();
    } catch (e, s) {
      log('Error while creating and account', error: e, stackTrace: s);
      _view.registerError();
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
