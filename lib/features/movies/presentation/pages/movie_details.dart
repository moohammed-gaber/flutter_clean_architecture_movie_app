import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
        height: 800,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CachedNetworkImage(
            imageUrl: movie.poster,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          Column(
            children: [Text('${movie.title} ()')],
          )
        ]),
      )),
    );
  }
}
