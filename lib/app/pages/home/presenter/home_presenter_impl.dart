// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wca_flutter_app/app/pages/home/view/home_view.dart';
import 'package:wca_flutter_app/app/repository/user/user_repository.dart';

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
      final user = await userRepository.getMe();
      _view.updateUser(user);
    } on Exception catch (e) {
      _view.error('Error while getting user data');
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  set view(HomeView view) => _view = view;
}
