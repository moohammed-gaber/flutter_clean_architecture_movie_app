part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class LoadMovies extends MoviesEvent {
  @override
  List<Object> get props => [];
}
