import '../../../models/group_stickers.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupStickers> album);
  void error(String message);
  void updateStatusFilter(status);
  void updateAlbum(List<GroupStickers> album);
}
