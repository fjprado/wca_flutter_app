import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:wca_flutter_app/app/models/register_sticker_model.dart';
import 'package:wca_flutter_app/app/models/sticker_model.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/group_stickers.dart';
import './stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio dio;
  StickersRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<GroupStickers>> getMyAlbum() async {
    try {
      final result = await dio.auth().get('/api/countries');
      return result.data
          .map<GroupStickers>((group) => GroupStickers.fromMap(group))
          .toList();
    } on DioError catch (e, s) {
      log('Error while getting user album data', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error while getting user album data');
    }
  }

  @override
  Future<StickerModel?> findStickerByCode(
      String stickerCode, String stickerNumber) async {
    try {
      final result = await dio.auth().get(
        '/api/sticker-search',
        queryParameters: {
          'sticker_code': stickerCode,
          'sticker_number': stickerNumber,
        },
      );

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      if (e.response?.statusCode == 404) return null;

      log('Error while getting sticker', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error while getting sticker');
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({
        ...registerStickerModel.toMap(),
        'sticker_image_upload': '',
      });

      final result = await dio.auth().post('/api/sticker', data: body);
      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Error while adding sticker to album', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error while adding sticker to album');
    }
  }
}
