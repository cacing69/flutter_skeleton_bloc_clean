import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_skeleton_bloc_clean/features/login/domain/usecases/login_use_case.dart';
// import 'package:email_validator/email_validator.dart';
import 'package:injectable/injectable.dart';
// import 'package:flutter_skeleton_bloc_clean/features/auth/domain/usecases/login_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

@lazySingleton
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitialState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginSubmittedEvent>(_onLoginSubmitted);
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginState> emit) {
    const isEmailValid = true;
    final currentState = state;
    if (currentState is LoginValidationState) {
      emit(LoginValidationState(
        isEmailValid: isEmailValid,
        isPasswordValid: currentState.isPasswordValid,
      ));
    } else {
      emit(LoginValidationState(
        isEmailValid: isEmailValid,
        isPasswordValid: false,
      ));
    }
  }

  void _onPasswordChanged(
      PasswordChangedEvent event, Emitter<LoginState> emit) {
    final isPasswordValid = event.password.length >= 6;
    final currentState = state;
    if (currentState is LoginValidationState) {
      emit(LoginValidationState(
        isEmailValid: currentState.isEmailValid,
        isPasswordValid: isPasswordValid,
      ));
    } else {
      emit(LoginValidationState(
        isEmailValid: false,
        isPasswordValid: isPasswordValid,
      ));
    }
  }

  void _onLoginSubmitted(
      LoginSubmittedEvent event, Emitter<LoginState> emit) async {
    final currentState = state;
    if (currentState is LoginValidationState &&
        currentState.isEmailValid &&
        currentState.isPasswordValid) {
      emit(LoginLoadingState());
      final result =
          await loginUseCase(username: event.email, password: event.password);
      result.fold(
        (failure) => emit(LoginErrorState(message: failure.toString())),
        (_) => emit(LoginSuccessState()),
      );
    } else {
      emit(LoginErrorState(message: "Email or Password is invalid."));
    }
  }
}
