part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {}

class SearchPhraseEvent extends SearchEvent {
  final String phrase;
  final int tabIndex;

  SearchPhraseEvent({required this.tabIndex, required this.phrase});
  @override
  List<Object?> get props => [this.phrase, this.tabIndex];
}

// class DownloadSongEvent extends SearchEvent {
//   final String fileName;
//   final String urlString;

//   DownloadSongEvent({required this.urlString, required this.fileName});
//   @override
//   List<Object?> get props => [this.urlString, this.fileName];
// }
