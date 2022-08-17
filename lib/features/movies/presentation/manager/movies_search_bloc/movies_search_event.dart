part of 'movies_search_bloc.dart';

abstract class MoviesSearchEvent extends Equatable {
  const MoviesSearchEvent();
}

class TextChanged extends MoviesSearchEvent {
  const TextChanged({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
