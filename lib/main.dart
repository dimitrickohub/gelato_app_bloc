import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelato_app_bloc/Resources/repository_songs.dart';

import 'package:gelato_app_bloc/Screens/HomePageScreen/home_page.dart';

import 'BLoC/songs_bloc.dart';

void main() {
  Bloc.observer = BlocObserver();
  runApp(App(
    repository: Repository(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SongsBloc(
            repository: repository,
          )..add(SongsStarted()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const HomePage(),
        },
      ),
    );
  }
}
