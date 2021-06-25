import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:musicplayer/models/download_song.dart';
import 'package:musicplayer/models/http_request.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitialState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchPhraseEvent) {
      yield* mapSearchPhraseEventToState(event);
    }
    // if (event is DownloadSongEvent) {
    //   await DownloadSong.downloadFile(event.urlString, event.fileName);
    // }
  }

  Stream<SearchState> mapSearchPhraseEventToState(
      SearchPhraseEvent event) async* {
    yield SearchInProgressState();
    var response = await MyHttpRequest.searchRequest(event.phrase);
    Object? responseError = (jsonDecode(response.body)["error"]);

    if (event.phrase == "") {
      yield SearchInitialState();
    } else if (responseError != null) {
      yield SearchFailedState(result: responseError);
    } else {
      List result = (jsonDecode(response.body)["data"]);
      if (event.tabIndex != 0) {
        result = result.where((element) {
          if (event.tabIndex == 1) {
            return element["artist"]["name"]
                .toString()
                .toLowerCase()
                .contains(event.phrase.toLowerCase());
          } else if (event.tabIndex == 2) {
            return element["title"]
                .toString()
                .toLowerCase()
                .contains(event.phrase.toLowerCase());
          } else if (event.tabIndex == 3) {
            return element["album"]["title"]
                .toString()
                .toLowerCase()
                .contains(event.phrase.toLowerCase());
          }
          return true;
        }).toList();
      }
      print(result);

      yield SearchSucceedState(result: result);
    }
  }
}
