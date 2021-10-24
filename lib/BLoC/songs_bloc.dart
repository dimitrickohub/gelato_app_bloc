import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/Resources/repository.dart';
import 'package:rxdart/subjects.dart';

class SongsBloc {
  final _repository = Repository();
  final _songsFetcher = PublishSubject<SongsJson?>();

  Stream<SongsJson?> get allSongs => _songsFetcher.stream;
  fetchAllSongs() async {
    SongsJson? itemModel = await _repository.fetchAllSongs();
    _songsFetcher.sink.add(itemModel);
  }

  dispose() {
    _songsFetcher.close();
  }
}

final bloc = SongsBloc();
