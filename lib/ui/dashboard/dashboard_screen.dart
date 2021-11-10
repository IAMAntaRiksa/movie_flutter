import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/bloc/cubit/buttom_nav_cubit.dart';
import 'package:flutter_movie/ui/favorit/favorite_screen.dart';
import 'package:flutter_movie/ui/home/home_screen.dart';
import 'package:flutter_movie/ui/profile/profile_screen.dart';
import 'package:flutter_movie/ui/search/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const String routeName = '/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Widget> _dashboardBodyWidgets = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const FavoriteScreenWideget(),
    const ProfileScreen(),
    // const Placeholder(color: Colors.red),
    // const Placeholder(color: Colors.blue),
    // const Placeholder(color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtomNavCubit, ButtomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.selectedIndexBody,
            children: _dashboardBodyWidgets,
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: _mainMenuItems(),
            currentIndex: state.selectedIndexBody,
            onTap: (index) {
              context.read<ButtomNavCubit>().navigeTo(index);
            },
            // selectedLabelStyle: selectedMainMenuStyle,
            // unselectedLabelStyle: unselectedMainMenuStyle,
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _mainMenuItems() {
    return <BottomNavigationBarItem>[
      _mainMenuItemWidget('Home', Icons.home),
      _mainMenuItemWidget('Search', Icons.search),
      _mainMenuItemWidget('Favorite', Icons.favorite),
      _mainMenuItemWidget('Profile', Icons.person),
    ];
  }

  BottomNavigationBarItem _mainMenuItemWidget(
      String menuTitle, IconData iconData) {
    return BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
        child: Icon(
          iconData,
          color: Colors.yellowAccent,
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
        child: Icon(iconData, color: Colors.blue),
      ),
      label: menuTitle,
    );
  }
}
