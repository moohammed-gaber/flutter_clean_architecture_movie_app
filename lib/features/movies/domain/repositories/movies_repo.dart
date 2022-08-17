import 'package:clean_arch_movie_app/core/failures/failures.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/genre_movies.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<GenreMovies>>> getAll();

  Future<Either<Failure, List<Movie>>> search(String text);
}
