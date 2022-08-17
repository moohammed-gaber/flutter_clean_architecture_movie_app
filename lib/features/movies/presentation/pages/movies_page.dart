import 'package:clean_arch_movie_app/core/injection.dart';
import 'package:clean_arch_movie_app/core/presentation/widgets/retry.dart';
import 'package:clean_arch_movie_app/features/movies/data/data_sources/movies_remote_data_source.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/manager/movies_bloc.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/widgets/genre_movies_scrollable_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injection.getIt.get<MoviesBloc>()..add(LoadMovies()),
      child: Scaffold(
        body: Builder(builder: (context) {
/*
          MoviesRemoteDataSource(Injection.getIt.get<Dio>())
              .getAll()
              .then((value) => print(value));
*/
/*
          context
              .read<MoviesBloc>()
              .getMoviesUseCase
              .repo
              .getAll()
              .then((value) => print(value));
*/
          return BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoadSuccess) {
                final data = state.genreMovies;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      for (int i = 0; i < data.length; i++)
                        GenreMoviesScrollableList(genreMovies: data[i])
                    ],
                  )),
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
              if (state is MoviesLoadFailure) return Retry(onRetry: () {});
            },
          );
        }),
      ),
    );
  }
}
