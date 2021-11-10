import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/dashboard/dashboard_screen.dart';
import 'package:flutter_movie/ui/splashscreen/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
        context,
        DashboardScreen.routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
