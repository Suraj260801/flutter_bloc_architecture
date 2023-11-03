import 'package:bloc_architecture/src/bloc/dash_board/user_bloc.dart';
import 'package:bloc_architecture/src/bloc/dash_board/user_event.dart';
import 'package:bloc_architecture/src/bloc/dash_board/user_state.dart';
import 'package:bloc_architecture/src/repository/remote_user_repo.dart';
import 'package:bloc_architecture/src/ui/bits/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
      ),
      body: RepositoryProvider<RemoteUserRepo>(
        create: (context) => RemoteUserRepo(),
        child: BlocProvider<UserBloc>(
          create: (context) =>
              UserBloc(RepositoryProvider.of<RemoteUserRepo>(context))
                ..add(UserLoadingEvent()),
          child: BlocConsumer<UserBloc, UserState>(
              builder: (BuildContext context, UserState state) {
                if (state is UserLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserLoadedState) {
                  return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: const CircleAvatar(child: Icon(Icons.person),),
                          title: Text(state.users[index].name),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: state.users.length);
                } else {
                  return const Center(
                    child: CustomText(data: "Something Went Wrong!"),
                  );
                }
              },
              listener: (BuildContext context, UserState state) {}),
        ),
      ),
    );
  }
}
