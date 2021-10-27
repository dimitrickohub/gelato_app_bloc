import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelato_app_bloc/BLoC/songs_bloc.dart';

import 'package:gelato_app_bloc/Screens/HomePageScreen/home_app_bar.dart';
import 'package:gelato_app_bloc/Screens/HomePageScreen/album_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: HomeAppBar(),
      ),
      body: BlocBuilder<SongsBloc, SongsState>(
        builder: (context, state) {
          if (state is SongsLoaded) {
            return AlbumScreen(snapshot: state.songs);
          }
          if (state is SongsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
