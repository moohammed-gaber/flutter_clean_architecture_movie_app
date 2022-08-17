import 'package:clean_arch_movie_app/core/configured_dio.dart';
import 'package:clean_arch_movie_app/features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:clean_arch_movie_app/features/movies/data/movies_genres_generator.dart';
import 'package:clean_arch_movie_app/features/movies/data/repositories/movies_repo_impl.dart';
import 'package:clean_arch_movie_app/features/movies/domain/use_cases/get_movies_use_case.dart';
import 'package:clean_arch_movie_app/features/movies/domain/use_cases/search_movies_use_case.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/manager/movies_bloc.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/manager/movies_search_bloc/movies_search_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class Injection {
  static final getIt = GetIt.instance;

  static setup() async {
    getIt.registerSingleton<Dio>(
      ConfiguredDio().dio,
    );
    final dio = getIt.get<Dio>();
    getIt.registerSingleton<MoviesRepoImpl>(
      MoviesRepoImpl(MoviesRemoteDataSource(dio), GenreMoviesGenerator()),
    );

    getIt.registerFactory<MoviesBloc>(() => MoviesBloc(
          GetMoviesUseCase(getIt.get<MoviesRepoImpl>()),
        ));
    getIt.registerFactory<MoviesSearchBloc>(() => MoviesSearchBloc(
          SearchMoviesUseCase(getIt.get<MoviesRepoImpl>()),
        ));
  }
}
