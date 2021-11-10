import 'package:flutter/foundation.dart';
import 'package:flutter_movie/storage/hive.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:hive/hive.dart';

abstract class MoviesLocalDataSource {
  void addToFavorite(MovieItem movie);

  void putToFavorite(String key, MovieItem movie);

  void deleteFromFavorite(String key);

  List<MovieItem> listFavorite();

  MovieItem getFavorite(String key);

  ValueListenable<Box<MovieItem>> listenable();
}

class MoviesLocalDataSourceImpl implements MoviesLocalDataSource {
  HiveDB hiveDb = HiveDB();

  @override
  void addToFavorite(MovieItem movie) {
    hiveDb.add<MovieItem>(boxName: KEYBOX, value: movie);
  }

  @override
  void deleteFromFavorite(String key) {
    print('DELETE: KEY: $key');
    hiveDb.delete<MovieItem>(boxName: KEYBOX, key: key);
  }

  @override
  MovieItem getFavorite(String key) {
    return hiveDb.get(boxName: KEYBOX, key: key);
  }

  @override
  List<MovieItem> listFavorite() {
    return hiveDb.list(boxName: KEYBOX);
  }

  @override
  ValueListenable<Box<MovieItem>> listenable() {
    return hiveDb.listenable(boxName: KEYBOX);
  }

  @override
  void putToFavorite(String key, MovieItem movie) {
    hiveDb.put(boxName: KEYBOX, key: key, value: movie);
  }
}
