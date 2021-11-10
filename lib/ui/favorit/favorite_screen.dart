import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/favorit/favorite_body.dart';
import 'package:flutter_movie/values/colors.dart';

class FavoriteScreenWideget extends StatelessWidget {
  const FavoriteScreenWideget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // title: const Text('Profile'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                colorBlackDrue,
                Colors.green,
              ],
            ),
          ),
        ),
      ),
      body: FavoriteBodyScreenWidget(),
    );
  }
}
