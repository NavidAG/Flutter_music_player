part of 'now_playing_bloc.dart';

@immutable
abstract class NowPlayingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSongEvent extends NowPlayingEvent {
  final int id;

  GetSongEvent({required this.id});

  @override
  List<Object?> get props => [this.id];
}

class PlaySongEvent extends NowPlayingEvent {}

class PauseSongEvent extends NowPlayingEvent {}
