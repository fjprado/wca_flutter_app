import 'dart:developer';
import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/register_user_model.dart';
import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio dio;

  AuthRepositoryImpl({required this.dio});

  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      final result = await dio
          .post('/api/auth', data: {'email': email, 'password': password});

      final accessToken = result.data['access_token'];
      if (accessToken == null) throw UnauthorizedException();

      return accessToken;
    } on DioError catch (e, s) {
      log('Error while login process', error: e, stackTrace: s);
      if (e.response?.statusCode == 401) throw UnauthorizedException();
      throw RepositoryException(message: 'Error while login process');
    }
  }

  

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await dio.unAuth().post(
            '/api/register',
            data: registerModel.toMap(),
          );
    } on DioError catch (e, s) {
      log('Error while creating an account', error: e, stackTrace: s);
      throw RepositoryException(message: 'Error while creating an account');
    }
  }
}
