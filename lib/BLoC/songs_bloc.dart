import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/Resources/repository_songs.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc({required this.repository}) : super(SongsLoading()) {
    on<SongsStarted>(_onStarted);
  }

  final Repository repository;

  void _onStarted(SongsStarted event, Emitter<SongsState> emit) async {
    emit(SongsLoading());
    try {
      final songs = await repository.fetchAllSongs();
      emit(SongsLoaded(songs: songs!));
    } catch (_) {
      emit(SongsError());
    }
  }

  // final _songsFetcher = PublishSubject<SongsJson?>();

  // Stream<SongsJson?> get allSongs => _songsFetcher.stream;
  // fetchAllSongs() async {
  //   SongsJson? itemModel = await _repository.fetchAllSongs();
  //   _songsFetcher.sink.add(itemModel);
  // }

  // dispose() {
  //   _songsFetcher.close();
  // }
}

// final bloc = SongsBloc();
