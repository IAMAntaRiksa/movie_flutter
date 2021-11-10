import 'package:flutter/material.dart';
import 'package:flutter_movie/data/movies/model/list_dumie_category.dart';

class HomeListCategory extends StatefulWidget {
  const HomeListCategory({Key? key}) : super(key: key);

  @override
  _HomeListCategoryState createState() => _HomeListCategoryState();
}

class _HomeListCategoryState extends State<HomeListCategory> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: catsegory
            .asMap()
            .entries
            .map((MapEntry map) => homeCategoriii(map.key))
            .toList(),
      ),
    );
  }
}

Widget homeCategoriii(int index) {
  return Container(
    margin: const EdgeInsets.only(top: 30, right: 1, left: 10),
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(20),
        shape: BoxShape.rectangle),
    child: Text(
      catsegory[index],
      style: const TextStyle(color: Colors.green),
    ),
  );
}
