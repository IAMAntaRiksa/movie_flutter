import 'package:flutter/material.dart';
import 'package:flutter_movie/values/images.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(imageLOGO),
    );
  }
}
