import 'package:flutter/material.dart';
import 'package:flutter_movie/data/movies/local/movie_data_local_storage.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/_reusable/silver/gridview_list.dart';
import 'package:hive/hive.dart';

class FavoriteBodyScreenWidget extends StatelessWidget {
  FavoriteBodyScreenWidget({Key? key}) : super(key: key);

  final MoviesLocalDataSource _moviesLocalDataSource =
      MoviesLocalDataSourceImpl();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<MovieItem>>(
        valueListenable: _moviesLocalDataSource.listenable(),
        builder: (context, box, child) {
          List<MovieItem> movieItem = box.values.toList();

          return MovieGridViewWidget(movie: movieItem);
        });
  }
}
