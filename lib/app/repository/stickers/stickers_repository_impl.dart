import 'dart:developer';
import 'package:dio/dio.dart';

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
}
