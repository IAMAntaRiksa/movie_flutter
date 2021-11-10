import 'package:dio/dio.dart';
import 'package:flutter_movie/data/movies/logging.dart';
import 'package:flutter_movie/data/movies/model/list_response.dart';
import 'package:flutter_movie/data/movies/model/movie_detail_response.dart';
import 'package:flutter_movie/data/movies/model/movie_item_response.dart';

const String baseUrl = 'https://api.themoviedb.org/3';
const String imagebaseUrl = 'https://image.tmdb.org/t/p/w500';
const String apiKey = '8c0ee423823065c242f7d18b73262365';
const String lanGuage = 'en-US';

class ApiClientResponse {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      sendTimeout: 30000,
    ),
  )..interceptors.add(Logging());

  // call api
  Future<List<MovieItemResponse>?> getPopularMovie() async {
    List<MovieItemResponse>? movieItemResponsess;

    try {
      Response response = await _dio.get(
        '/movie/upcoming/',
        queryParameters: {
          'api_key': apiKey,
          'language': lanGuage,
        },
      );
      ListResponse<MovieItemResponse> moviesResponse =
          ListResponse<MovieItemResponse>.fromJson(
        response.data,
        (json) => MovieItemResponse.fromJson(json as Map<String, dynamic>),
      );

      movieItemResponsess = moviesResponse.result;
    } on DioError catch (e) {
      if (e.response != null) {
        print(
            'Error getPopularMovie, ${e.response!.data} - ${e.response!.statusCode}');
      } else {
        print('Somthing Error ${e.message}');
      }
    }
    return movieItemResponsess;
  }

  Future<MovieDetailResponse?>? getMovieDetail(int movieId) async {
    MovieDetailResponse? movieDetail;

    try {
      Response response =
          await _dio.get('/movie/$movieId?api_key=$apiKey&language=$lanGuage');

      MovieDetailResponse movieDetailResponse =
          MovieDetailResponse.fromJson(response.data);
      return movieDetailResponse;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error : getMovieDetail');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Unexpected error!');
        print(e.message);
      }
    }

    return movieDetail;
  }

  Future<MovieItemResponse?>? getSearchQuery() async {
    MovieItemResponse? query;

    try {
      Response responses = await _dio.get(
        '/movie/popular/',
        queryParameters: {
          'api_key': apiKey,
          'language': lanGuage,
        },
      );

      MovieItemResponse movieItemResponse =
          MovieItemResponse.fromJson(responses.data);

      query = movieItemResponse;
    } on DioError catch (e) {
      if (e.response != null) {
        print(
            'Error(getPopularMovies), ${e.response!.data} - ${e.response!.statusCode}');
      } else {
        print('Somthing Error ${e.message}');
      }
    }
    return query;
  }
}
