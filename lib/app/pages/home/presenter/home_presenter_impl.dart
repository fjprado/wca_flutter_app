import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/user/user_repository.dart';
import '../view/home_view.dart';
import './home_presenter.dart';

class HomePresenterImpl implements HomePresenter {
  final UserRepository userRepository;
  late HomeView _view;

  HomePresenterImpl({
    required this.userRepository,
  });

  @override
  Future<void> getUserData() async {
    try {
      _view.showLoader();
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } on Exception catch (_) {
      _view.error('Error while getting user data');
    }
  }

  @override
  Future<void> logout() async {
    try {
      _view.showLoader();
      final sp = await SharedPreferences.getInstance();
      sp.clear();
      _view.logoutSuccess();
    } on Exception catch (_) {
      _view.error('Error while logout');
    }
  }

  @override
  set view(HomeView view) => _view = view;
}
