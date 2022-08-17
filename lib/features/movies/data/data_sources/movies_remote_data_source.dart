import 'package:clean_arch_movie_app/features/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';

class MoviesRemoteDataSource {
  final Dio _dio;

  MoviesRemoteDataSource(this._dio);

  Future<List<MovieModel>> getAll() async {
    final result = await _dio.get('/movies');
    print(result.data);
    return MovieModel.fromJsonList(result.data);
  }
}
