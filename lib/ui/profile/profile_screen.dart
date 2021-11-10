import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/profile/profile_body.dart';
import 'package:flutter_movie/values/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBlackDrue,
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
        body: const ProfileBody(),
      ),
    );
  }
}
