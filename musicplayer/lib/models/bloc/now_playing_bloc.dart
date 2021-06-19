import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:musicplayer/models/http_request.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  AudioPlayer audioPlayer = AudioPlayer();
  dynamic songJson;
  NowPlayingBloc() : super(LoadSongInProgress());

  @override
  Stream<NowPlayingState> mapEventToState(
    NowPlayingEvent event,
  ) async* {
    if (event is GetSongEvent) {
      yield* mapGetSongEventToState(event);
    }
    if (event is PlaySongEvent) {
      yield* mapPlaySongEventToState(event);
    }
    if (event is PauseSongEvent) {
      yield* mapPauseSongEventToState(event);
    }
  }

  Stream<NowPlayingState> mapGetSongEventToState(GetSongEvent event) async* {
    yield LoadSongInProgress();
    var response = await MyHttpRequest.getMusicByID(event.id);
    Object? responseError = jsonDecode(response.body)["error"];
    if (responseError != null) {
      yield GetSongFailed(error: responseError);
    } else {
      songJson = jsonDecode(response.body);
      yield SongIsLoadedState();

      var url = songJson["preview"];

      await audioPlayer.setUrl(url);
      yield SongIsPausedState();
    }
  }

  Stream<NowPlayingState> mapPlaySongEventToState(PlaySongEvent event) async* {
    if (state is SongIsPausedState) {
      audioPlayer.play();
      yield SongIsPlayingState();
    }
  }

  Stream<NowPlayingState> mapPauseSongEventToState(
      PauseSongEvent event) async* {
    if (state is SongIsPlayingState) {
      audioPlayer.pause();
      yield SongIsPausedState();
    }
  }
}
