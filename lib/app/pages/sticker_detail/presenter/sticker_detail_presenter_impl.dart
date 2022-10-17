// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:wca_flutter_app/app/pages/sticker_detail/view/sticker_detail_view.dart';
import 'package:wca_flutter_app/app/repository/stickers/stickers_repository.dart';

import '../../../models/sticker_model.dart';
import '../../../models/user_sticker_model.dart';
import '../../../services/sticker/find_sticker_service.dart';
import './sticker_detail_presenter.dart';

class StickerDetailPresenterImpl implements StickerDetailPresenter {
  late final StickerDetailView _view;
  final FindStickerService findStickerService;
  final StickersRepository stickersRepository;
  UserStickerModel? stickerUser;
  StickerModel? sticker;
  int amount = 0;

  StickerDetailPresenterImpl({
    required this.findStickerService,
    required this.stickersRepository,
  });

  @override
  set view(StickerDetailView view) => _view = view;

  @override
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  }) async {
    this.stickerUser = stickerUser;

    if (stickerUser == null) {
      sticker = await findStickerService.execute(countryCode, stickerNumber);
    }

    bool hasSticker = stickerUser != null;

    if (hasSticker) {
      amount = stickerUser.duplicateStickers + 1;
    }

    _view.screenLoaded(
        hasSticker, countryCode, stickerNumber, countryName, amount);
  }

  @override
  void decreaseAmount() {
    if (amount > 1) {
      _view.updateAmount(--amount);
    }
  }

  @override
  void increaseAmount() {
    _view.updateAmount(++amount);
  }

  @override
  Future<void> saveSticker() async {
    try {
      _view.showLoader();
      if (stickerUser == null) {
        await stickersRepository.registerUserSticker(sticker!.id, amount);
      } else {
        await stickersRepository.updateUserSticker(
            stickerUser!.idSticker, amount);
      }
      _view.saveSuccess();
    } on Exception catch (e) {
      _view.error('Error while adding or updating sticker');
    }
  }

  @override
  Future<void> deleteSticker() async {
    try {
      _view.showLoader();
      if (stickerUser != null) {
        await stickersRepository.updateUserSticker(stickerUser!.idSticker, 0);
      }
      _view.saveSuccess();
    } on Exception catch (e) {
      _view.error('Error while deleting sticker');
    }
  }
}
