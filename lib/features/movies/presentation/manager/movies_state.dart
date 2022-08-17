part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoadInProgress extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoadSuccess extends MoviesState {
  final List<GenreMovies> genreMovies;

  const MoviesLoadSuccess(
    this.genreMovies,
  );

  @override
  // TODO: implement props
  List<Object?> get props => [genreMovies];
}

class MoviesLoadFailure extends MoviesState {
  MoviesLoadFailure();

  @override
  List<Object> get props => [];
}
