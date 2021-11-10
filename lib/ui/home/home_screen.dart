import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/home/home_body_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBodyScreen(),
    );
  }
}
