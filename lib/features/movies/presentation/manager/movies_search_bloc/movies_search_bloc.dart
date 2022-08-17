import 'package:bloc/bloc.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:clean_arch_movie_app/features/movies/domain/use_cases/search_movies_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'movies_search_event.dart';

part 'movies_search_state.dart';

const _duration = const Duration(milliseconds: 700);

EventTransformer<TextChanged> debounceTransformer<TextChanged>(
    Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).switchMap(mapper);
  };
}

class MoviesSearchBloc extends Bloc<MoviesSearchEvent, MoviesSearchState> {
  final SearchMoviesUseCase searchMoviesUseCase;

  MoviesSearchBloc(this.searchMoviesUseCase) : super(MoviesSearchInitial()) {
    on<TextChanged>(_onTextChanged,
        transformer: debounceTransformer(_duration));
  }

  void _onTextChanged(
    TextChanged event,
    Emitter<MoviesSearchState> emit,
  ) async {
    emit(SearchStateLoading());
    final results = await searchMoviesUseCase.call(SearchParams(event.text));
    emit(results.fold((l) => SearchStateError(),
        (r) => r.isEmpty ? MoviesSearchStateEmpty() : SearchStateSuccess(r)));
  }
}
