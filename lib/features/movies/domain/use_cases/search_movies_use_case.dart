import 'package:clean_arch_movie_app/core/failures/failures.dart';
import 'package:clean_arch_movie_app/core/use_case/use_case.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/genre_movies.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:clean_arch_movie_app/features/movies/domain/repositories/movies_repo.dart';
import 'package:dartz/dartz.dart';

class SearchMoviesUseCase implements FailureUseCase<List<Movie>, SearchParams> {
  final MoviesRepo repo;

  SearchMoviesUseCase(this.repo);

  @override
  Future<Either<Failure, List<Movie>>> call(SearchParams params) {
    return repo.search(params.text);
  }
}

class SearchParams {
  final String text;

  SearchParams(this.text);
}
