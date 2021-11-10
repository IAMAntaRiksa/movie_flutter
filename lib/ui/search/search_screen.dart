import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/search/search_body.dart';
import 'package:flutter_movie/values/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: colorBlackDrue,
      body: SearchBody(),
    );
  }
}
