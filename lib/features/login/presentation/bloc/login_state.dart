part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginValidationState extends LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;

  const LoginValidationState({
    required this.isEmailValid,
    required this.isPasswordValid,
  });

  @override
  List<Object> get props => [isEmailValid, isPasswordValid];
}
