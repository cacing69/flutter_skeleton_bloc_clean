import 'package:flutter_skeleton_bloc_clean/core/network/network_info.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/data/datasources/remote_user_data_source.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/data/repositories/user_repository_impl.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/repositories/user_repository.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/usecases/get_users_use_case.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Network
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker()),
  );

  // Dio
  sl.registerLazySingleton<Dio>(() {
    Dio dio = Dio();

    // Menambahkan interceptor untuk menambahkan header
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print("${options.uri}");
        options.headers['Authorization'] = 'Bearer your_token_here';
        options.headers['Custom-Header'] = 'Your Custom Header Value';
        return handler.next(options); // Melanjutkan request
      },
    ));

    return dio;
  });

  // Data Sources
  sl.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSource(sl()),
  );

  // sl.registerLazySingleton<LocalUserDataSource>(
  //   () => LocalUserDataSourceImpl(),
  // );

  // Repository
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Use Cases
  sl.registerLazySingleton(() => GetUsersUseCase(sl()));
  // sl.registerLazySingleton(() => AddUserUseCase(sl()));
  // sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
  // sl.registerLazySingleton(() => DeleteUserUseCase(sl()));

  // Bloc
  sl.registerFactory(
    () => UserBloc(
      getUsersUseCase: sl(),
      // addUserUseCase: sl(),
      // updateUserUseCase: sl(),
      // deleteUserUseCase: sl(),
    ),
  );
}
