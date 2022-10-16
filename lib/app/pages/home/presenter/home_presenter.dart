import '../../../core/mvp/wca_presenter.dart';
import '../view/home_view.dart';

abstract class HomePresenter extends WcaPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
