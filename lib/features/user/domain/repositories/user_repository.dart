import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

@factory
abstract class UserRepository {
  // Metode untuk mengambil semua user
  Future<Either<Failure, List<User>>> getUsers(
      {required int page, required int pageSize});

  // Metode untuk mengambil user berdasarkan ID
  // Future<Either<Failure, User>> getUserById(int id);

  // // Metode untuk membuat user baru
  // Future<Either<Failure, User>> createUser(User user);

  // // Metode untuk memperbarui user
  // Future<Either<Failure, User>> updateUser(User user);

  // // Metode untuk menghapus user
  // Future<Either<Failure, void>> deleteUser(int id);

  // // Metode untuk mencari user berdasarkan kriteria tertentu
  // Future<Either<Failure, List<User>>> searchUsers({
  //   String? name,
  //   String? email,
  //   int? page,
  //   int? limit,
  // });
}
