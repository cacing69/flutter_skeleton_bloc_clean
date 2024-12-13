import 'package:dio/dio.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/data/models/user_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/user_model.dart';

part 'remote_user_data_source.g.dart';

// Remote Data Source (API)
@RestApi(baseUrl: 'https://dummyjson.com')
@injectable
abstract class RemoteUserDataSource {
  @factoryMethod
  factory RemoteUserDataSource(Dio dio) = _RemoteUserDataSource;

  @GET("/users")
  Future<UserResponse> getUsers({
    @Query("page") int? page, // Default page 1
    @Query("limit") int limit = 10, // Default limit 10
  });

  @POST("/users")
  Future<UserModel> createUser(@Body() UserModel user);

  @PUT("/users/{id}")
  Future<UserModel> updateUser(@Path("id") int id, @Body() UserModel user);

  @DELETE("/users/{id}")
  Future<void> deleteUser(@Path("id") int id);
}

// // Local Data Source (SQLite/Hive)
// abstract class LocalUserDataSource {
//   Future<List<UserModel>> getUsers();
//   Future<UserModel> createUser(UserModel user);
//   Future<UserModel> updateUser(UserModel user);
//   Future<void> deleteUser(int id);
// }

// class LocalUserDataSourceImpl implements LocalUserDataSource {
//   // Implementasi dengan SQLite atau Hive
//   @override
//   Future<List<UserModel>> getUsers() async {
//     // TODO: Implementasi pengambilan data lokal
//     return [];
//   }

//   @override
//   Future<UserModel> createUser(UserModel user) async {
//     // TODO: Implementasi penyimpanan lokal
//     return user;
//   }

//   @override
//   Future<UserModel> updateUser(UserModel user) async {
//     // TODO: Implementasi update lokal
//     return user;
//   }

//   @override
//   Future<void> deleteUser(int id) async {
//     // TODO: Implementasi hapus data lokal
//   }
// }
