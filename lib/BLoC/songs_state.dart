part of 'songs_bloc.dart';

@immutable
abstract class SongsState extends Equatable {
  const SongsState();
}

class LoadingSongsState extends SongsState {
  @override
  List<SongsJson> get props => [];
}

class LoadedSongsState extends SongsState {
  const LoadedSongsState({required this.songs});

  final SongsJson songs;

  @override
  List<Object> get props => [songs];
}

class ErrorSongsState extends SongsState {
  @override
  List<Object> get props => [];
}
