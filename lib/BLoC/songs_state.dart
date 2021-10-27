part of 'songs_bloc.dart';

@immutable
abstract class SongsState extends Equatable {
  const SongsState();
}

class SongsLoading extends SongsState {
  @override
  List<SongsJson> get props => [];
}

class SongsLoaded extends SongsState {
  const SongsLoaded({required this.songs});

  final SongsJson songs;

  @override
  List<Object> get props => [songs];
}

class SongsError extends SongsState {
  @override
  List<Object> get props => [];
}
