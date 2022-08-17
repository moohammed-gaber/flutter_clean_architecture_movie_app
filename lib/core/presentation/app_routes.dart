import 'package:clean_arch_movie_app/features/movies/presentation/pages/movies_page.dart';

class AppRoutes {
  static const String movies = '/';
  static const String movieDetails = '/login';
  static const String search = '/register';

  static get routes => {
        movies: (context) => MoviesPage(),
/*
        movieDetails: (context) => LoginPage(),
        search: (context) => RegisterBlocProvider(),
*/
      };
}
