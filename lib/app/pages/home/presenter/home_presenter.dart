import 'package:wca_flutter_app/app/core/mvp/wca_presenter.dart';
import 'package:wca_flutter_app/app/pages/home/view/home_view.dart';

abstract class HomePresenter extends WcaPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
