import 'package:bloc/bloc.dart';
import 'package:clean_arch_movie_app/core/use_case/use_case.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/genre_movies.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:clean_arch_movie_app/features/movies/domain/use_cases/get_movies_use_case.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';

part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;

  MoviesBloc(this.getMoviesUseCase) : super(MoviesInitial()) {
    on<LoadMovies>((event, emit) async {
      emit(MoviesLoadInProgress());
      final result = await getMoviesUseCase.call(NoParams());
      emit(result.fold(
        (failure) => MoviesLoadFailure(),
        (movies) => MoviesLoadSuccess(movies),
      ));
    });
  }
}
