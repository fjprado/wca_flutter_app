import 'package:wca_flutter_app/app/core/mvp/wca_presenter.dart';

import '../../../models/user_sticker_model.dart';
import '../view/sticker_detail_view.dart';

abstract class StickerDetailPresenter extends WcaPresenter<StickerDetailView> {
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  });

  void increaseAmount();
  void decreaseAmount();

  Future<void> saveSticker();
  Future<void> deleteSticker();
}
