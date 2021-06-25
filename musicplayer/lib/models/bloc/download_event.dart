part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();

  @override
  List<Object> get props => [];
}

class DownloadSongEvent extends DownloadEvent {
  final String fileName;
  final String urlString;

  DownloadSongEvent({required this.urlString, required this.fileName});
  @override
  List<Object> get props => [this.urlString, this.fileName];
}
