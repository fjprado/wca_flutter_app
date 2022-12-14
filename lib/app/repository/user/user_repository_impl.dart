import 'dart:developer';
import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/user_model.dart';
import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;

  UserRepositoryImpl({
    required this.dio,
  });

  @override
  Future<UserModel> getMe() async {
    try {
      final result = await dio.auth().get('/api/me');
      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Error while getting logged user data', error: e, stackTrace: s);
      throw RepositoryException(
          message: 'Error while getting logged user data');
    }
  }
}
