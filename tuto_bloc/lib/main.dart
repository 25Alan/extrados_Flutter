import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_bloc/biocs/app_blocs.dart';
import 'package:tuto_bloc/biocs/app_events.dart';
import 'package:tuto_bloc/models/models.dart';
import 'package:tuto_bloc/repos/repositories.dart';

import 'biocs/app_states.dart';
import 'details_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('The APP')),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            List<PokeModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         DetailScreen(e: userList[index]),
                      // ),
                      // );
                    },
                    child: Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          userList[index].url,
                          style: const TextStyle(color: Colors.white),
                        ),
                        // trailing: CircleAvatar(
                        //     backgroundImage:
                        //         NetworkImage(userList[index].name)),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          if (state is UserErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        }),
      ),
    );
  }
}
