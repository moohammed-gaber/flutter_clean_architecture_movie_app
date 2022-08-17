import 'package:clean_arch_movie_app/features/movies/presentation/pages/movie_details.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/pages/movies_page.dart';
import 'package:clean_arch_movie_app/features/movies/presentation/pages/movies_search.dart';

class AppRoutes {
  static const String movies = '/';
  static const String movieDetails = '/login';
  static const String search = '/register';

  static get routes => {
        movies: (context) => MoviesPage(),
        movieDetails: (context) => MovieDetails(),
        search: (context) => MoviesSearchRoot(),

/*
        search: (context) => RegisterBlocProvider(),
*/
      };
}
