import 'package:dartz/dartz.dart';
import 'package:flutter_skeleton_bloc_clean/core/errors/failures.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  Future<Either<Failure, T>> call<T>(
      {required String username, required String password}) async {
    return Right({"state": true} as T);
  }
}
