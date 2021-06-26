part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object> get props => [];
}

class DownloadInitial extends DownloadState {}

class DownloadInProgressState extends DownloadState {
  final Stream<double> stream;

  DownloadInProgressState({required this.stream});

  @override
  List<Object> get props => [this.stream];
}

class DownloadFinishedState extends DownloadState {}
