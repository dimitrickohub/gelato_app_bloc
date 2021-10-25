import 'package:flutter/material.dart';
import 'package:gelato_app_bloc/BLoC/songs_bloc.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/Screens/HomePageScreen/home_app_bar.dart';
import 'package:gelato_app_bloc/Screens/HomePageScreen/list_albums.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllSongs();
    return Scaffold(
      appBar: const HomeAppBar() as PreferredSizeWidget?,
      body: StreamBuilder(
        stream: bloc.allSongs,
        builder: (context, AsyncSnapshot<SongsJson?> snapshot) {
          if (snapshot.hasData) {
            return BuildList(snapshot: snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
