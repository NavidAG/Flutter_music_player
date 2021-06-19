part of 'search_bloc.dart';

@immutable
abstract class SearchEvent extends Equatable {}

class SearchPhraseEvent extends SearchEvent {
  final String phrase;

  SearchPhraseEvent({required this.phrase});
  @override
  List<Object?> get props => [this.phrase];
}
