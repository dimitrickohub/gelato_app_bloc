import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelato_app_bloc/BLoC/songs_bloc.dart';
import 'package:gelato_app_bloc/screens/home_page_pcreen/album_screen.dart';
import 'package:gelato_app_bloc/screens/home_page_pcreen/home_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: HomeAppBar(),
      ),
      body: BlocBuilder<SongsBloc, SongsState>(
        builder: (context, state) {
          if (state is LoadedSongsState) {
            return AlbumScreen(snapshot: state.songs);
          }
          if (state is LoadingSongsState) {
            return const Center(child: CircularProgressIndicator());
          }
          return const Center(child: Text('Something went wrong'));
        },
      ),
    );
  }
}
