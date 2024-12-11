import 'package:flutter_skeleton_bloc_clean/features/user/data/models/user_model.dart';

class UserResponse {
  final List<UserModel> users;

  UserResponse({required this.users});

  // Parsing dari JSON
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    // print(json['users']);
    var list = json['users'] as List;
    List<UserModel> usersList = list.map((i) => UserModel.fromJson(i)).toList();
    return UserResponse(users: usersList);
  }
}
