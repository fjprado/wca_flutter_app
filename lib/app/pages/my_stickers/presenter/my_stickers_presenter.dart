import 'package:wca_flutter_app/app/core/mvp/wca_presenter.dart';
import 'package:wca_flutter_app/app/pages/my_stickers/view/my_stickers_view.dart';

abstract class MyStickersPresenter extends WcaPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
  void countryFilter(List<String>? countries);
  void refresh();
}
