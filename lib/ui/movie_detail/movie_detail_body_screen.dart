import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/data/movies/local/movie_data_local_storage.dart';
import 'package:flutter_movie/data/movies/model/movie_detail_response.dart';
import 'package:flutter_movie/data/remote/movie_api_client.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/_reusable/silver_view_widget.dart';
import 'package:hive/hive.dart';

class MovieDetailBody extends StatefulWidget {
  final int movieId;
  const MovieDetailBody({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailBody> createState() => _MovieDetailBodyState();
}

class _MovieDetailBodyState extends State<MovieDetailBody> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  final MoviesLocalDataSource _moviesLocalDataSource =
      MoviesLocalDataSourceImpl();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiClientResponse.getMovieDetail(widget.movieId),
        builder: (context, AsyncSnapshot<MovieDetailResponse?> snapshoot) {
          if (snapshoot.hasData) {
            if (snapshoot.data != null) {
              MovieDetailResponse movie = snapshoot.data!;

              return ValueListenableBuilder<Box<MovieItem>>(
                valueListenable: _moviesLocalDataSource.listenable(),
                builder: (context, box, child) {
                  List<int> favoriteIds = box.values.map((e) => e.id).toList();
                  bool isFavorite = favoriteIds.contains(movie.id);

                  return SliverViewWidget(
                    title: movie.title.toString(),
                    imageUrl: "$imagebaseUrl${movie.posterPath}",
                    body: _buildBody(movie),
                    onFavoritePressed: () {
                      if (isFavorite) {
                        _moviesLocalDataSource
                            .deleteFromFavorite(movie.id.toString());
                      } else {
                        _moviesLocalDataSource.putToFavorite(
                            movie.id.toString(),
                            MovieItem.fromMovieDetailResponse(movie));
                      }
                    },
                    isFavorites: isFavorite,
                  );
                },
              );
            }
          } else {
            print('Error');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}

Column _buildBody(MovieDetailResponse movie) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        '${movie.title}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      Row(
        children: [
          Text(
            '${movie.runtime} minutes',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const Expanded(child: SizedBox.shrink()),
          Row(
            children: [
              const Icon(
                Icons.star_rate,
                color: Colors.amberAccent,
                size: 12,
              ),
              const SizedBox(width: 4),
              Text(
                '${movie.voteAverage}',
                style: const TextStyle(),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 6,
        children: movie.genres
                ?.map((e) => Chip(label: Text(e.name ?? '')))
                .toList() ??
            [],
      ),
      const SizedBox(height: 16),
      Text(
        '${movie.overview}',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 54,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: movie.productionCompanies
                  ?.map(
                    (e) => CachedNetworkImage(
                      imageUrl: "$imagebaseUrl${e.logoPath}",
                      height: 54,
                    ),
                  )
                  .toList() ??
              [],
        ),
      ),
      Text(
        '${movie.productionCompanies?.map((e) => e.name)}',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    ],
  );
}
