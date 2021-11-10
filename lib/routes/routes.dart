import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/dashboard/dashboard_screen.dart';
import 'package:flutter_movie/ui/movie_detail/movie_detail_screen.dart';
import 'package:flutter_movie/ui/profile/profile_screen.dart';
import 'package:flutter_movie/ui/search/search_screen.dart';
import 'package:flutter_movie/ui/splashscreen/splash_screen.dart';

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case DashboardScreen.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case SearchScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case MovieDetailScreen.routeName:
        var movieArgs = settings.arguments as MovieDetailArguments;
        return MaterialPageRoute(
          builder: (_) => MovieDetailScreen(args: movieArgs),
        );
    }
  }
}
