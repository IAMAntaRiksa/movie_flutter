import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/home/List_category/list_category.dart';
import 'package:flutter_movie/ui/home/now_playing/home_playing_detail_listview.dart';
import 'package:flutter_movie/ui/home/popular/home_detail_listview.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        HomeDetailListView(),
        HomeListCategory(),
        SizedBox(height: 15),
        MoviePlayingListView(),
      ],
    );
  }
}
