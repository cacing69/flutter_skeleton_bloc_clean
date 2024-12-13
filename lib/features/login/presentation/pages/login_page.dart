// login_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_bloc_clean/features/login/presentation/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Login Success')));
            } else if (state is LoginErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              return SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        'Content in the Center of the Screen',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go("/");
                      },
                      child: const Text('Flat Button'),
                    ),
                  ],
                ),
              );
            },
          ),
        ));

    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text('Hello, World!'),
    //       SizedBox(height: 20),
    //       Text('Welcome to Flutter.'),
    //     ],
    //   ),
    // ),
    // );
    // BlocProvider(
    //   create: (context) =>
    //       LoginBloc(loginUseCase: context.read<LoginUseCase>()),
    //   child: Scaffold(
    //     appBar: AppBar(title: Text('Login')),
    //     body: BlocListener<LoginBloc, LoginState>(
    //       listener: (context, state) {
    //         if (state is LoginSuccessState) {
    //           ScaffoldMessenger.of(context)
    //               .showSnackBar(SnackBar(content: Text('Login Success')));
    //         } else if (state is LoginErrorState) {
    //           ScaffoldMessenger.of(context)
    //               .showSnackBar(SnackBar(content: Text(state.message)));
    //         }
    //       },
    //       child: BlocBuilder<LoginBloc, LoginState>(
    //         builder: (context, state) {
    //           return Padding(
    //             padding: const EdgeInsets.all(16.0),
    //             child: Column(
    //               children: [
    //                 TextField(
    //                   controller: emailController,
    //                   decoration: InputDecoration(labelText: 'Email'),
    //                   onChanged: (email) {
    //                     context
    //                         .read<LoginBloc>()
    //                         .add(EmailChangedEvent(email: email));
    //                   },
    //                 ),
    //                 TextField(
    //                   controller: passwordController,
    //                   obscureText: true,
    //                   decoration: InputDecoration(labelText: 'Password'),
    //                   onChanged: (password) {
    //                     context
    //                         .read<LoginBloc>()
    //                         .add(PasswordChangedEvent(password: password));
    //                   },
    //                 ),
    //                 SizedBox(height: 20),
    //                 if (state is LoginValidationState)
    //                   ElevatedButton(
    //                     onPressed: (state.isEmailValid && state.isPasswordValid)
    //                         ? () {
    //                             context.read<LoginBloc>().add(
    //                                 LoginSubmittedEvent(
    //                                     email: emailController.text,
    //                                     password: passwordController.text));
    //                           }
    //                         : null,
    //                     child: state is LoginLoadingState
    //                         ? CircularProgressIndicator()
    //                         : Text('Login'),
    //                   ),
    //                 if (state is LoginLoadingState) CircularProgressIndicator(),
    //                 if (state is LoginErrorState)
    //                   Text(state.message, style: TextStyle(color: Colors.red)),
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
