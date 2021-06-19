part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchInitialState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchInProgressState extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchSucceedState extends SearchState {
  final List result;

  SearchSucceedState({required this.result});
  @override
  List<Object?> get props => [this.result];
}

class SearchFailedState extends SearchState {
  final Object result;

  SearchFailedState({required this.result});
  @override
  List<Object?> get props => [this.result];
}
