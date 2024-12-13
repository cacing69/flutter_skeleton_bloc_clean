import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/entities/user.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/domain/usecases/get_users_use_case.dart';
import 'package:injectable/injectable.dart';
// import 'package:user_management_app/features/user_management/domain/usecases/get_users.dart';
// import 'package:user_management_app/features/user_management/domain/usecases/add_user.dart';
// import 'package:user_management_app/features/user_management/domain/usecases/update_user.dart';
// import 'package:user_management_app/features/user_management/domain/usecases/delete_user.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;
  int currentPage = 1; // Menyimpan halaman saat ini
  static const int pageSize = 10; // Jumlah item per halaman
  // final AddUserUseCase addUserUseCase;
  // final UpdateUserUseCase updateUserUseCase;
  // final DeleteUserUseCase deleteUserUseCase;

  UserBloc({
    required this.getUsersUseCase,
    // required this.addUserUseCase,
    // required this.updateUserUseCase,
    // required this.deleteUserUseCase,
  }) : super(UserInitialState()) {
    on<FetchUsersEvent>(_onFetchUsers);
    on<RefreshUsersEvent>(_onRefreshUsers);
    on<FetchNextPageEvent>(_onFetchNextPageEvent);
    // on<AddUserEvent>(_onAddUser);
    // on<UpdateUserEvent>(_onUpdateUser);
    // on<DeleteUserEvent>(_onDeleteUser);
  }

  void _onFetchNextPageEvent(
      FetchNextPageEvent event, Emitter<UserState> emit) async {
    // Cek apakah masih ada lebih banyak data
    print((state as UserLoadedState).hasMore);
    if (state is UserLoadedState && !(state as UserLoadedState).hasMore) {
      return; // Tidak ada data lebih lanjut
    }

    currentPage++; // Naikkan halaman untuk memuat data berikutnya

    final currentState = state;
    print(currentState);
    if (currentState is UserLoadedState) {
      emit(UserLoadingState());
      print("_onFetchNextPageEvent({$currentState}):${currentPage}");
      final newUsers =
          await getUsersUseCase(page: currentPage, pageSize: pageSize);
      newUsers.fold(
        (failure) => emit(UserErrorState(message: failure.toString())),
        (users) {
          final allUsers = List<User>.from(currentState.users)..addAll(users);
          emit(UserLoadedState(
            users: allUsers,
            isFetched: true,
            hasMore:
                users.length >= pageSize, // Cek apakah ada lebih banyak data
          ));
        },
      );
    }
  }

  void _onRefreshUsers(RefreshUsersEvent event, Emitter<UserState> emit) async {
    // print("state {$state}");
    // // print("RefreshUsersEvent");
    emit(UserLoadingState());
    currentPage = 1;
    // emit(UserErrorState(message: "this is error"));\emit(UserLoadingState());
    final result = await getUsersUseCase(page: currentPage, pageSize: 10);
    result.fold(
      (failure) => emit(UserErrorState(message: failure.toString())),
      (users) => emit(UserLoadedState(
          users: users, isFetched: true, hasMore: users.length >= pageSize)),
    );
  }

  void _onFetchUsers(FetchUsersEvent event, Emitter<UserState> emit) async {
    // if (event is RefreshUsersEvent) {
    //   _eventHandler();
    // }

    // (state as UserLoadedState).isFetched = true;
    if (state is UserLoadedState && (state as UserLoadedState).isFetched) {
      // Data sudah dimuat, tidak perlu memuat ulang
      return;
    }

    emit(UserLoadingState());
    final result = await getUsersUseCase(page: 1, pageSize: 10);
    result.fold(
      (failure) => emit(UserErrorState(message: failure.toString())),
      (users) {
        emit(UserLoadedState(
            users: users, isFetched: true, hasMore: users.length >= pageSize));
      },
    );
  }

  // Implementasi metode lainnya serupa dengan _onFetchUsers
}
