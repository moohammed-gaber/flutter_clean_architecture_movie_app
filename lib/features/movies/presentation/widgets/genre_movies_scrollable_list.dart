import 'package:clean_arch_movie_app/features/movies/domain/entities/genre_movies.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class GenreMoviesScrollableList extends StatelessWidget {
  const GenreMoviesScrollableList({Key? key, required this.genreMovies})
      : super(key: key);
  final GenreMovies genreMovies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(genreMovies.genre.name, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          SizedBox(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: genreMovies.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieCard(
                  movie: genreMovies.movies[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
