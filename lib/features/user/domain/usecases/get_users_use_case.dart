import 'package:dartz/dartz.dart';
import 'package:flutter_skeleton_bloc_clean/core/errors/failures.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/entities/user.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  Future<Either<Failure, List<User>>> call(
      {required int page, required int pageSize}) async {
    return await repository.getUsers(page: page, pageSize: pageSize);
  }
}
