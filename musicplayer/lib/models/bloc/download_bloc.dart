import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:musicplayer/models/download_song.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitial());

  @override
  Stream<DownloadState> mapEventToState(
    DownloadEvent event,
  ) async* {
    if (event is DownloadSongEvent) {
      yield* mapDownloadSongEventToState(event);
    }
  }

  Stream<DownloadState> mapDownloadSongEventToState(
      DownloadEvent event) async* {
    DownloadSong downloadSong = DownloadSong();

    downloadSong.downloadFile(
        (event as DownloadSongEvent).urlString, event.fileName);
    yield DownloadInProgressState(
        stream: downloadSong.stream.asBroadcastStream());
  }
}
