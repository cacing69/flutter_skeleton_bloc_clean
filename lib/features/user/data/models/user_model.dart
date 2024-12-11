import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    int? id,
    String? firstName,
    String? email,
    String? image,
  }) : super(
          id: id,
          firstName: firstName,
          email: email,
          image: image,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  factory UserModel.fromEntity(User user) => UserModel(
        id: user.id,
        firstName: user.firstName,
        email: user.email,
        image: user.image,
      );

  User toEntity() => User(
        id: id,
        firstName: firstName,
        email: email,
        image: image,
      );
}
