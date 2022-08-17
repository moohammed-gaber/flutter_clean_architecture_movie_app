import 'package:clean_arch_movie_app/features/movies/domain/entities/genre.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';

class GenreMovies {
  final Genre genre;
  final List<Movie> movies;

  GenreMovies(this.genre, this.movies);
}
