import 'package:flutter_movie/data/movies/model/movie_detail_response.dart';
import 'package:hive/hive.dart';

import 'package:flutter_movie/data/movies/model/movie_item_response.dart';

part 'movie_item.g.dart';

@HiveType(typeId: 1)
class MovieItem {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String judul;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String deskripsi;

  @HiveField(4)
  final double? ratting;

  @HiveField(5)
  final DateTime? realeseData;

  MovieItem({
    required this.id,
    required this.judul,
    required this.image,
    required this.deskripsi,
    required this.ratting,
    required this.realeseData,
  });

  factory MovieItem.fromMovieItemResponse(MovieItemResponse response) {
    return MovieItem(
        id: response.id ?? 0,
        judul: response.title ?? '',
        image: response.posterPath ?? '',
        deskripsi: response.overview ?? '',
        ratting: response.voteAverage ?? 0.0,
        realeseData: response.releaseDate == null
            ? null
            : DateTime.parse(response.releaseDate!));
  }

  factory MovieItem.fromMovieDetailResponse(MovieDetailResponse response) {
    return MovieItem(
        id: response.id ?? 0,
        judul: response.title ?? '',
        image: response.posterPath ?? '',
        deskripsi: response.overview ?? '',
        ratting: response.voteAverage ?? 0.0,
        realeseData: response.releaseDate == null
            ? null
            : DateTime.parse(response.releaseDate!));
  }
}
