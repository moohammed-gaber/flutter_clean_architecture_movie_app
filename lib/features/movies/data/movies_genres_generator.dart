import 'package:clean_arch_movie_app/features/movies/data/models/movie_model.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/genre.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/genre_movies.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';

class GenreMoviesGenerator {
  GenreMoviesGenerator();

  List<GenreMovies> generate(List<MovieModel> movies) {
    final Map<String, List<Movie>> map = {};
    for (int i = 0; i < movies.length; i++) {
      final element = movies[i];
      final genres = element.genres;
      for (int i = 0; i < genres.length; i++) {
        final genre = genres[i];
        map[genre] = [...?map[genre], element.toDomain()];
      }
    }
    final genreMoviesModel = <GenreMovies>[];
    map.forEach((key, value) {
      genreMoviesModel.add(GenreMovies(Genre(name: key), value));
    });
    return genreMoviesModel;
  }
}
