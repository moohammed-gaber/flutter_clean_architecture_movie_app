import 'package:clean_arch_movie_app/core/injection.dart';
import 'package:clean_arch_movie_app/core/presentation/widgets/retry.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/manager/movies_search_bloc/movies_search_bloc.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/widgets/movie_search_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesSearchRoot extends StatelessWidget {
  const MoviesSearchRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MoviesSearch(),
        create: (context) => Injection.getIt.get<MoviesSearchBloc>()
          ..add(TextChanged(text: '')));
  }
}

class MoviesSearch extends StatelessWidget {
  String? lastInputValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  onChanged: (inputValue) {
                    if (lastInputValue != inputValue) {
                      lastInputValue = inputValue;
                      context
                          .read<MoviesSearchBloc>()
                          .add(TextChanged(text: inputValue));
                    }
                  },
                  decoration: InputDecoration(hintText: 'Search here ..'))),

          Expanded(
            child: BlocBuilder<MoviesSearchBloc, MoviesSearchState>(
              builder: (_, state) {
                if (state is MoviesSearchStateEmpty) {
                  return Center(
                    child: Text('Not found any result ..'),
                  );
                }
/*
                if (state is MoviesSearchInitial) {
                  return Center(
                    child: Text('Start search ..'),
                  );
                }
*/

                if (state is SearchStateError) {
                  return Center(
                    child: Retry(
                      onRetry: () {
                        context
                            .read<MoviesSearchBloc>()
                            .add(TextChanged(text: ''));
                      },
                    ),
                  );
                }
                if (state is SearchStateSuccess) {
                  final items = state.items;
                  return ListView.separated(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];
                      return MovieSearchCard(movie: item);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

          // Bloc
        ],
      ),
    );
  }
}
