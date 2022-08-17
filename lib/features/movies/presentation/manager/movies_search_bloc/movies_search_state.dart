part of 'movies_search_bloc.dart';

abstract class MoviesSearchState extends Equatable {
  const MoviesSearchState();
}

class MoviesSearchInitial extends MoviesSearchState {
  @override
  List<Object> get props => [];
}

class MoviesSearchStateEmpty extends MoviesSearchState {
  List<Object?> get props => [];
}

class SearchStateLoading extends MoviesSearchState {
  List<Object?> get props => [];
}

class SearchStateSuccess extends MoviesSearchState {
  const SearchStateSuccess(
    this.items,
  );

  final List<Movie> items;

  @override
  List<Object> get props => [
        items,
      ];

  SearchStateSuccess copyWith({
    List<Movie>? items,
  }) {
    return SearchStateSuccess(
      items ?? this.items,
    );
  }
}

class SearchStateError extends MoviesSearchState {
  const SearchStateError();

  @override
  List<Object> get props => [];
}
