part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

// State awal sebelum proses apa pun
class UserInitialState extends UserState {}

// State saat sedang memuat data
class UserLoadingState extends UserState {}

// State saat data users berhasil dimuat
class UserLoadedState extends UserState {
  final List<User> users;
  final bool isFetched;
  final bool hasMore;

  const UserLoadedState({
    required this.users,
    this.isFetched = false,
    this.hasMore = true,
  });

  @override
  List<Object?> get props => [users, isFetched, hasMore];
}

class UserErrorState extends UserState {
  final String message;

  const UserErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

// // State saat pencarian user
// class UserSearchState extends UserState {
//   final List<User> searchResults;

//   const UserSearchState({required this.searchResults});

//   @override
//   List<Object?> get props => [searchResults];
// }

// // State saat terjadi error

// // State saat user berhasil ditambahkan
// class UserAddedState extends UserState {
//   final User user;

//   const UserAddedState({required this.user});

//   @override
//   List<Object?> get props => [user];
// }

// // State saat user berhasil diupdate
// class UserUpdatedState extends UserState {
//   final User user;

//   const UserUpdatedState({required this.user});

//   @override
//   List<Object?> get props => [user];
// }

// // State saat user berhasil dihapus
// class UserDeletedState extends UserState {
//   final int userId;

//   const UserDeletedState({required this.userId});

//   @override
//   List<Object?> get props => [userId];
// }
