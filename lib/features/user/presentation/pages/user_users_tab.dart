import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton_bloc_clean/features/user/presentation/bloc/user_bloc.dart';

class UserUsersTab extends StatefulWidget {
  @override
  _UserUsersTabState createState() => _UserUsersTabState();
}

class _UserUsersTabState extends State<UserUsersTab> {
  @override
  void initState() {
    super.initState();
    // print("initState");
    // context.read<UserBloc>().add(FetchUsersEvent());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Ketika mencapai bagian bawah, ambil halaman berikutnya
        // context.read<UserBloc>().add(FetchNextPageEvent());
        print("SCROL NJIR");
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pastikan hanya memanggil event jika tab ini diakses
    context.read<UserBloc>().add(FetchUsersEvent());
  }

  Future<void> _refreshUsers() async {
    // context.read<UserBloc>().add(FetchUsersEvent());
    print("_refreshUsers");
  }

  final ScrollController _scrollController =
      ScrollController(keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                child: Text("Refresh"),
                onPressed: () {
                  context.read<UserBloc>().add(RefreshUsersEvent());
                },
              )
            ],
          ),
          Flexible(child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is UserLoadedState) {
                // print(state.users);
                return RefreshIndicator(
                    child: ListView.builder(
                      key: PageStorageKey(
                          'userListView'), // Menambahkan key tetap
                      controller: _scrollController,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: state.users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                              "${(index + 1)} ${state.users[index].firstName}" ??
                                  "-"),
                        );
                      },
                    ),
                    onRefresh: _refreshUsers);
                // ListTile(
                //   key: ValueKey(users[index]),
                //   title: Text(users[index]),
                // );
                // return Placeholder();
                // return UserList(users: state.users);
              } else if (state is UserErrorState) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return SizedBox.shrink();
            },
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // print("clicked : RefreshUsersEvent");
          // context.read<UserBloc>().add(RefreshUsersEvent());
          context.read<UserBloc>().add(FetchNextPageEvent());
          // showDialog(
          //   context: context,
          //   // builder: (c ontext) => AddUserDialog(),
          //   // builder: (context) => true),
          // );
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
