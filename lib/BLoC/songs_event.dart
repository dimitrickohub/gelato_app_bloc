part of 'songs_bloc.dart';

@immutable
abstract class SongsEvent extends Equatable {
  const SongsEvent();
}

class SongsStarted extends SongsEvent {
  @override
  List<SongsJson> get props => [];
}
