import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/home/popular/home_horizontal_listitem_screen.dart';
import 'package:flutter_movie/ui/movie_detail/movie_detail_screen.dart';

class HomeHorizontalListViewWidget extends StatelessWidget {
  // final List<MovieItemResponse> movieItemRespo;
  final List<MovieItem> movieItemRespo;
  const HomeHorizontalListViewWidget({
    Key? key,
    required this.movieItemRespo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 220,
        aspectRatio: 2.0,
        viewportFraction: 0.8,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
        autoPlay: true,
        enableInfiniteScroll: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemCount: movieItemRespo.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          //  deletee Column
          HomeHorizontalListItemWidget(
        movieItemR: movieItemRespo[itemIndex],
        onTap: () {
          Navigator.pushNamed(context, MovieDetailScreen.routeName,
              arguments: MovieDetailArguments(
                  movieId: movieItemRespo[itemIndex].id,
                  movieName: movieItemRespo[itemIndex].judul));
        },
      ),
    );
  }
}
