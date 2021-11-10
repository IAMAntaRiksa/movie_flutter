import 'package:flutter/material.dart';
import 'package:flutter_movie/data/movies/model/movie_item_response.dart';
import 'package:flutter_movie/data/remote/movie_api_client.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/search/components/home_itemview_screen.dart';

class MovieSearchWidget extends StatelessWidget {
  const MovieSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiClientResponse apiClientResponse = ApiClientResponse();
    return FutureBuilder(
        future: apiClientResponse.getPopularMovie(),
        builder: (contetx, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot != null) {
              List<MovieItemResponse> datas = snapshot.data!;
              List<MovieItem> movieItemsa =
                  datas.map((e) => MovieItem.fromMovieItemResponse(e)).toList();
              return Column(
                children: [
                  HomeSearchDataScreen(datamovies: movieItemsa),
                ],
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
