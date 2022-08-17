import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch_movie_app/core/presentation/app_routes.dart';
import 'package:clean_arch_movie_app/core/presentation/widgets/custom_rating_indicator.dart';
import 'package:clean_arch_movie_app/features/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    // print(movie.ratingOutTen);
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(AppRoutes.movieDetails, arguments: movie),
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 180,
              imageUrl: movie.poster,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
/*
            SizedBox(
              height: 40,
              child:
            ),
*/
            Text(
              movie.title,
              // maxLines: 2,
            ),
            Align(
                alignment: AlignmentDirectional.centerStart,
                child: CustomRatingIndicator(
                    rating: movie.ratingOutFive, size: 15))
          ],
        ),
      ),
    );
  }
}
