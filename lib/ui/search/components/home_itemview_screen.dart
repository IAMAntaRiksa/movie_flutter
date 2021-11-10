import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/_modelHive/movie_item.dart';
import 'package:flutter_movie/ui/movie_detail/movie_detail_screen.dart';
import 'package:flutter_movie/ui/search/components/movie_item_search.dart';

class HomeSearchDataScreen extends StatelessWidget {
  const HomeSearchDataScreen({
    Key? key,
    required this.datamovies,
  }) : super(key: key);

  final List<MovieItem> datamovies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: datamovies.length,
          itemBuilder: (contex, index) {
            return Column(
              children: [
                HomeItemSearch(
                  movieItems: datamovies[index],
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetailScreen.routeName);
                  },
                ),
              ],
            );
          }),
    );
  }
}
