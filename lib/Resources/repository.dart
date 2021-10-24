import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/Resources/fetch_songs.dart';

class Repository {
  final fetchSongs = FetchSongs();

  Future<SongsJson?> fetchAllSongs() => fetchSongs.getSongList();
}
