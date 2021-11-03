import 'package:gelato_app_bloc/Chopper/song_service.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';

class SongsRepository {
  Future<SongsJson?> getSongList() async {
    final myService = SongService.create();
    final response = await myService.getSongs();
    if (response.body != null) {
      SongsJson? songList = response.body;
      return songList;
    } else {
      return null;
    }
  }
}
