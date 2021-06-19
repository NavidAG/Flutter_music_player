part of 'now_playing_bloc.dart';

@immutable
abstract class NowPlayingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadSongInProgress extends NowPlayingState {}

class SongIsLoadedState extends NowPlayingState {}

class GetSongFailed extends NowPlayingState {
  final Object error;

  GetSongFailed({required this.error});

  @override
  List<Object?> get props => [this.error];
}

class SongIsPlayingState extends NowPlayingState {}

class SongIsPausedState extends NowPlayingState {}

class SongIsFinishedState extends NowPlayingState {}
