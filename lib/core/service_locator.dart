import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.config.dart'; // Ini yang di-generate

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.init(); // Fungsi yang dihasilkan oleh build_runner

  // // Network
  // getIt.registerLazySingleton<NetworkInfo>(
  //   () => NetworkInfoImpl(InternetConnectionChecker()),
  // );
}



// Future<void> initializeDependencies() async {
//   // Network
//   sl.registerLazySingleton<NetworkInfo>(
//     () => NetworkInfoImpl(InternetConnectionChecker()),
//   );

//   // Dio
//   sl.registerLazySingleton<Dio>(() {
//     Dio dio = Dio();

//     // Menambahkan interceptor untuk menambahkan header
//     dio.interceptors.add(InterceptorsWrapper(
//       onRequest: (options, handler) {
//         print("${options.uri}");
//         options.headers['Authorization'] = 'Bearer your_token_here';
//         options.headers['Custom-Header'] = 'Your Custom Header Value';
//         return handler.next(options); // Melanjutkan request
//       },
//     ));

//     return dio;
//   });

//   // Data Sources
//   sl.registerLazySingleton<RemoteUserDataSource>(
//     () => RemoteUserDataSource(sl()),
//   );

//   // sl.registerLazySingleton<LocalUserDataSource>(
//   //   () => LocalUserDataSourceImpl(),
//   // );

//   // Repository
//   sl.registerLazySingleton<UserRepository>(
//     () => UserRepositoryImpl(
//       remoteDataSource: sl(),
//       networkInfo: sl(),
//     ),
//   );

//   // Use Cases
//   sl.registerLazySingleton(() => GetUsersUseCase(sl()));
//   // sl.registerLazySingleton(() => AddUserUseCase(sl()));
//   // sl.registerLazySingleton(() => UpdateUserUseCase(sl()));
//   // sl.registerLazySingleton(() => DeleteUserUseCase(sl()));

//   // Bloc
//   sl.registerFactory(
//     () => UserBloc(
//       getUsersUseCase: sl(),
//       // addUserUseCase: sl(),
//       // updateUserUseCase: sl(),
//       // deleteUserUseCase: sl(),
//     ),
//   );
// }
