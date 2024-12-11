import 'package:dartz/dartz.dart';
import 'package:flutter_skeleton_bloc_clean/core/errors/failures.dart';
import 'package:flutter_skeleton_bloc_clean/core/network/network_info.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/data/datasources/remote_user_data_source.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/entities/user.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource remoteDataSource;
  // final LocalUserDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource, // Pastikan ada named parameter seperti ini
    required this.networkInfo, // dan untuk networkInfo
  });

  @override
  Future<Either<Failure, List<User>>> getUsers(
      {required int page, required int pageSize}) async {
    // if (await networkInfo.isConnected) {
    try {
      final remoteUsers = await remoteDataSource.getUsers();
      // return Right(remoteUsers.map((model) => model.toEntity()).toList());
      return Right(remoteUsers.users);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
    // }
    // else {
    //   try {
    //     // final localUsers = await localDataSource.getUsers();
    //     // return Right(localUsers.map((model) => model.toEntity()).toList());
    //   } catch (e) {
    //     return Left(CacheFailure());
    //   }
    // }
  }

  // Implementasi metode lainnya serupa
}
