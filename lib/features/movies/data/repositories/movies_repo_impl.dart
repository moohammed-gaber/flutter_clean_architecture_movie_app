import 'package:clean_arch_movie_app/core/failures/failures.dart';
import 'package:clean_arch_movie_app/features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:clean_arch_movie_app/features/movies/data/movies_genres_generator.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/genre_movies.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/movies_repo.dart';

class MoviesRepoImpl implements MoviesRepo {
  final MoviesRemoteDataSource moviesRemoteDataSource;
  final GenreMoviesGenerator generator;

  MoviesRepoImpl(this.moviesRemoteDataSource, this.generator);

  Future<Either<Failure, List<GenreMovies>>> getAll() async {
    try {
      final result = await moviesRemoteDataSource.getAll();
      return right(generator.generate(result));
    } catch (e) {
      return left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> search(String text) async {
    try {
      final result = await moviesRemoteDataSource.search(text);
      print(result);
      return right((result.map((e) => e.toDomain()).toList()));
    } catch (e) {
      rethrow;
      return left(NetworkFailure());
    }
  }
}
