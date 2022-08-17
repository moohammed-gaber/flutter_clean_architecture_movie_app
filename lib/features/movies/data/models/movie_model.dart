// To parse this JSON data, do
//
//     final movieModel = movieModelFromJson(jsonString);

import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';

class MovieModel {
  static List<MovieModel> fromJsonList(str) =>
      List<MovieModel>.from((str['movies']).map((x) => MovieModel.fromJson(x)));

  MovieModel({
    required this.backdrop,
    required this.cast,
    required this.classification,
    required this.director,
    required this.genres,
    required this.id,
    required this.imdbRating,
    required this.length,
    required this.overview,
    required this.poster,
    required this.releasedOn,
    required this.slug,
    required this.title,
  });

  final String backdrop;
  final List<String> cast;
  final String classification;
  final List<String> director;
  final List<String> genres;
  final String id;
  final num imdbRating;
  final String length;
  final String overview;
  final String poster;
  final DateTime releasedOn;
  final String slug;
  final String title;

// to Domain
  Movie toDomain() {
    return Movie(
        backdrop: backdrop,
        cast: cast,
        classification: classification,
        director: director,
        genres: genres,
        id: id,
        ratingOutTen: imdbRating,
        length: length,
        overview: overview,
        poster: poster,
        releasedOn: releasedOn,
        slug: slug,
        title: title);
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    final jsonDirectors = json["director"];
    return MovieModel(
      backdrop: json["backdrop"],
      cast: List<String>.from(json["cast"].map((x) => x)),
      classification: json["classification"],
      director: jsonDirectors is List
          ? jsonDirectors.cast<String>()
          : [jsonDirectors as String],
      genres: List<String>.from(json["genres"].map((x) => x)),
      id: json["id"],
      imdbRating: json["imdb_rating"],
      length: json["length"],
      overview: json["overview"],
      poster: json["poster"],
      releasedOn: DateTime.parse(json["released_on"]),
      slug: json["slug"],
      title: json["title"],
    );
  }
}
