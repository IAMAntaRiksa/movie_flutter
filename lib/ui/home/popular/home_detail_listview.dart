import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/bloc/bloc/movie_bloc.dart';
import 'package:flutter_movie/data/movies/model/movie_item_response.dart';
import 'package:flutter_movie/data/remote/movie_api_client.dart';
import 'package:flutter_movie/data/remote/movie_remote_data_sourece.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/home/popular/home_horizontal_listvew_screen.dart';
import 'package:flutter_movie/ui/profile/profile_screen.dart';

class HomeDetailListView extends StatefulWidget {
  const HomeDetailListView({Key? key}) : super(key: key);

  @override
  _HomeDetailListViewState createState() => _HomeDetailListViewState();
}

class _HomeDetailListViewState extends State<HomeDetailListView> {
  @override
  Widget build(BuildContext context) {
    ApiClientResponse apiClientResponse = ApiClientResponse();
    return FutureBuilder<List<MovieItemResponse>?>(
        future: apiClientResponse.getPopularMovie(),
        builder: (contex, AsyncSnapshot<List<MovieItemResponse>?> snapshot) {
          if (snapshot.hasData) {
            if (snapshot != null) {
              List<MovieItemResponse?> dataMovies = snapshot.data!;

              List<MovieItem> itemMovie = dataMovies
                  .map((e) => MovieItem.fromMovieItemResponse(e!))
                  .toList();
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child:
                            IconButton(onPressed: null, icon: Icon(Icons.menu)),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('MOVIE',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ProfileScreen.routeName);
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/img_logo.png',
                              fit: BoxFit.cover,
                              height: 40,
                              width: 50,
                            )),
                      ),
                    ],
                  ),
                  HomeHorizontalListViewWidget(movieItemRespo: itemMovie),
                ],
              );
            }
          }
          return CircularProgressIndicator();
        });
  }
}
