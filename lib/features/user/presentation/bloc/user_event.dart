part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

// Event untuk mengambil daftar users
class FetchUsersEvent extends UserEvent {}

class RefreshUsersEvent extends UserEvent {}

class FetchNextPageEvent extends UserEvent {}

// Event untuk menambah user baru
// class AddUserEvent extends UserEvent {
//   final User user;

//   const AddUserEvent({required this.user});

//   @override
//   List<Object?> get props => [user];
// }

// // Event untuk memperbarui user
// class UpdateUserEvent extends UserEvent {
//   final User user;

//   const UpdateUserEvent({required this.user});

//   @override
//   List<Object?> get props => [user];
// }

// // Event untuk menghapus user
// class DeleteUserEvent extends UserEvent {
//   final int userId;

//   const DeleteUserEvent({required this.userId});

//   @override
//   List<Object?> get props => [userId];
// }

// // Event untuk mencari user
// class SearchUsersEvent extends UserEvent {
//   final String query;

//   const SearchUsersEvent({required this.query});

//   @override
//   List<Object?> get props => [query];
// }
