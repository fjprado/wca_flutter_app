import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:wca_flutter_app/app/core/config/env/env.dart';
import 'package:wca_flutter_app/app/core/rest/interceptors/auth_interceptor.dart';

class CustomDio extends DioForNative {

  final _authInterceptor = AuthInterceptor();
  
  CustomDio()
      : super(BaseOptions(
            baseUrl: Env.instance['backend_base_url'] ?? '',
            connectTimeout: 5000,
            receiveTimeout: 60000)) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  CustomDio auth() {
    interceptors.add(_authInterceptor);
    return this;
  }

  CustomDio unAuth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
