import 'package:flutter_movie/data/movies/model/movie_item_response.dart';
import 'package:flutter_movie/data/remote/movie_api_client.dart';
import 'package:flutter_movie/ui/_modelHive/movie_detail_item.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';

abstract class MoviesLocalDataSource {
  Future<List<MovieItem>?> listPopularMovies();
  Future<List<MovieItem>?> listNowPlayingMovies();
  Future<MovieDetail> detailMovie(String id);
  Future<List<MovieItem>?> listSearchMovies({required String keyword});
}

class MovieRemoteDataSourcImpl implements MoviesLocalDataSource {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  @override
  Future<MovieDetail> detailMovie(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieItem>?> listNowPlayingMovies() async {
    try {
      List<MovieItemResponse>? responses =
          await _apiClientResponse.getPopularMovie();
      if (responses != null) {
        return responses
            .map((e) => MovieItem.fromMovieItemResponse(e))
            .toList();
      }
    } catch (error) {
      print('Error: listNowPlayingMovies => $error');
    }

    return null;
  }

  @override
  Future<List<MovieItem>?> listPopularMovies() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieItem>?> listSearchMovies({required String keyword}) {
    throw UnimplementedError();
  }
}
