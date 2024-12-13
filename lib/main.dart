import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_bloc_clean/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter_skeleton_bloc_clean/features/login/presentation/pages/login_page.dart';
import '/features/user/presentation/pages/user_profile_tab.dart';
import '/features/user/presentation/pages/user_users_tab.dart';
import 'core/service_locator.dart';
import '/features/user/presentation/bloc/user_bloc.dart';
import '/features/user/presentation/pages/user_home_tab.dart';
import 'package:go_router/go_router.dart';

void main() async {
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<UserBloc>(),
            ),
          ],
          // child: MainPage(),
          child: MainPage(),
        ),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return BlocProvider(
            create: (_) => getIt<LoginBloc>(),
            child: LoginPage(),
          );
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // final router = getIt<GoRouter>();
    return MaterialApp.router(
      title: 'Flutter Skeleton',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    UserHomeTab(),
    UserUsersTab(),
    UserProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
