import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_contact_app/blocs/users_bloc.dart';
import 'package:watchlist_contact_app/blocs/users_event.dart';
import 'package:watchlist_contact_app/home_screen.dart';
import 'package:watchlist_contact_app/repo/repositories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(UserRepository())..add(LoadUsersEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(selectedTabIndex: 0,),
      ),
    );

    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(primarySwatch: Colors.blue),
    //   home: RepositoryProvider(
    //     create: (context) => UserRepository(),
    //     child: BlocProvider(
    //       create: (context) => UserBloc(RepositoryProvider.of<UserRepository>(context),)..add(GetUsersEvent()),
    //       child: const HomeScreen(),
    //     ),
    //   ),
    // );
  }
}
