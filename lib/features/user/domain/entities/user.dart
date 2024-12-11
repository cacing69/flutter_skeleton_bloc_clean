import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? firstName;
  final String? email;
  final String? image;

  const User({
    this.id,
    this.firstName,
    // required this.firstName,
    this.email,
    this.image,
  });

  @override
  List<Object?> get props => [id, firstName, email, image];

  User copyWith({
    int? id,
    String? firstName,
    String? email,
    String? image,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
}
