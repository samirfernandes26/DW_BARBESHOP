
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative{
  RestClient() : super(BaseOptions(
    baseUrl: 'http://192.168.254.218:8080',
    connectTimeout: Duration(seconds: 10),
    receiveTimeout: Duration(seconds: 60),
  )){
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true
      ),
    ]);
  }

  RestClient get auth {
    options.extra['Dio_auth_key'] = true;
    return this;
  }

  RestClient get unAuth {
    options.extra['Dio_auth_key'] = true;
    return this;
  }
}