import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelato_app_bloc/Resources/repository_songs.dart';
import 'package:gelato_app_bloc/screens/home_page_pcreen/home_page.dart';

import 'BLoC/songs_bloc.dart';

void main() {
  Bloc.observer = BlocObserver();
  runApp(App(
    repository: SongsRepository(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key, required this.repository}) : super(key: key);

  final SongsRepository repository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SongsBloc(
        repository: repository,
      )..add(InitializedSongsEvent()),
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
