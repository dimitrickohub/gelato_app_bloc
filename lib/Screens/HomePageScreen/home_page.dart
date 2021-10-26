import 'package:flutter/material.dart';
import 'package:gelato_app_bloc/BLoC/songs_bloc.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/Screens/HomePageScreen/home_app_bar.dart';
import 'package:gelato_app_bloc/Screens/HomePageScreen/album_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: HomeAppBar(),
      ),
      body: StreamBuilder(
        stream: bloc.allSongs,
        builder: (context, AsyncSnapshot<SongsJson?> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return AlbumScreen(snapshot: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
