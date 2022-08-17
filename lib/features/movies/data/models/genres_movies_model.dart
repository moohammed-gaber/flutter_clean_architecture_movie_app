import 'package:clean_arch_movie_app/features/movies/data/models/genre_model.dart';
import 'package:clean_arch_movie_app/features/movies/data/models/movie_model.dart';

class GenreMoviesModel {
  final GenreModel genre;
  final List<MovieModel> movies;

  GenreMoviesModel({required this.genre, required this.movies});
}
