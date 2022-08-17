import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch_movie_app/core/presentation/widgets/custom_rating_indicator.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Container(
            // color: Colors.red,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: CachedNetworkImage(
                      height: 400,
                      imageUrl: movie.poster,
                      // height: double.infinity,
                      // width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                  '${movie.title} (${movie.ratingOutTen})',
                                  style: TextStyle(fontSize: 14)),
                            ),
                            Spacer(),
                            CustomRatingIndicator(
                                rating: movie.ratingOutFive, size: 18)
                          ],
                        ),
                        SizedBox(height: 20),
                        Text('${movie.year} | ${movie.length}'),
                        Text('cast: ${movie.getCast} '),
                        Text('directors: ${movie.getDirectors} '),
                        SizedBox(height: 20),
                        Text('${movie.overview}'),
                      ],
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
