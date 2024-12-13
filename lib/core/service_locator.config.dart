// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../features/login/domain/usecases/login_use_case.dart' as _i642;
import '../features/login/presentation/bloc/login_bloc.dart' as _i1022;
import '../features/user/data/datasources/remote_user_data_source.dart'
    as _i568;
import '../features/user/data/repositories/user_repository_impl.dart' as _i272;
import '../features/user/domain/repositories/user_repository.dart' as _i751;
import '../features/user/domain/usecases/get_users_use_case.dart' as _i975;
import '../features/user/presentation/bloc/user_bloc.dart' as _i200;
import 'network/network_info.dart' as _i579;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i642.LoginUseCase>(() => _i642.LoginUseCase());
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.factory<_i568.RemoteUserDataSource>(
        () => _i568.RemoteUserDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i1022.LoginBloc>(
        () => _i1022.LoginBloc(loginUseCase: gh<_i642.LoginUseCase>()));
    gh.lazySingleton<_i579.NetworkInfo>(
        () => _i579.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()));
    gh.lazySingleton<_i751.UserRepository>(() => _i272.UserRepositoryImpl(
          remoteDataSource: gh<_i568.RemoteUserDataSource>(),
          networkInfo: gh<_i579.NetworkInfo>(),
        ));
    gh.factory<_i975.GetUsersUseCase>(
        () => _i975.GetUsersUseCase(gh<_i751.UserRepository>()));
    gh.factory<_i200.UserBloc>(
        () => _i200.UserBloc(getUsersUseCase: gh<_i975.GetUsersUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
