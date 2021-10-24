import 'package:gelato_app_bloc/Chopper/song_service.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';

class FetchSongs {
  Future<SongsJson?> getSongList() async {
    final myService = SongService.create();
    final response = await myService.getSongs();

    SongsJson? songList = response.body!;
    return songList;
  }
}
