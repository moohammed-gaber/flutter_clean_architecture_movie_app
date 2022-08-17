import 'package:clean_arch_movie_app/features/movies/data/models/movie_model.dart';
import 'package:dio/dio.dart';

class MoviesRemoteDataSource {
  final Dio _dio;
  static const _path = '/movies';

  MoviesRemoteDataSource(this._dio);

  Future<List<MovieModel>> getAll() async {
    final result = await _dio.get(_path);
    return MovieModel.fromJsonList(result.data);
  }

  Future<List<MovieModel>> search(String text) async {
    final result = await _dio.get('/$_path?q=$text');
    return MovieModel.fromJsonList(result.data);
  }
}
