import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gelato_app_bloc/Chopper/songs_model.dart';
import 'package:gelato_app_bloc/Resources/repository_songs.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  final SongsRepository repository;
  SongsBloc({required this.repository}) : super(LoadingSongsState()) {
    on<InitializedSongsEvent>(_onStarted);
  }

  void _onStarted(InitializedSongsEvent event, Emitter<SongsState> emit) async {
    emit(LoadingSongsState());
    final songs = await repository.getSongList();
    if (songs != null) {
      emit(LoadedSongsState(songs: songs));
    } else {
      emit(ErrorSongsState());
    }
  }
}
