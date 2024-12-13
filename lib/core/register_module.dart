import 'package:dio/dio.dart';
// import 'package:flutter_skeleton_bloc_clean/core/router.dart';
// import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();

  @lazySingleton
  Dio dio() {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("${options.uri}");
        options.headers['X-Authorization'] = 'Bearer your_token_here';
        options.headers['X-Header'] = 'Your Custom Header Value';
        print("${options.headers}");
        return handler.next(options); // Melanjutkan request
      },
    ));
    return dio;
  }
}
