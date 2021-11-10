import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/home/now_playing/home_playing_listitem_screen.dart';
import 'package:flutter_movie/ui/movie_detail/movie_detail_screen.dart';

class HomePlayingHorizontalListView extends StatelessWidget {
  // get to response
  // final List<MovieItemResponse> movieItemRespon;

  // get to modelHive
  final List<MovieItem> movieItemRespon;

  const HomePlayingHorizontalListView({
    Key? key,
    required this.movieItemRespon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const VerticalDivider(
          color: Colors.transparent,
          width: 1,
        ),
        itemCount: movieItemRespon.length,
        itemBuilder: (context, index) => SizedBox(
          height: 250,
          width: 198,
          child: HomePlayingHorizontalListItem(
            movieItems: movieItemRespon[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                MovieDetailScreen.routeName,
                arguments: MovieDetailArguments(
                  movieId: movieItemRespon[index].id,
                  movieName: movieItemRespon[index].judul,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
