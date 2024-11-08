import 'package:cinemapedia/presentation/views/home_views/favorite_view.dart';
import 'package:cinemapedia/presentation/views/home_views/home_view.dart';
import 'package:cinemapedia/presentation/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = "home_screen";
  final int pageIndex;
  final Widget childView;
  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoriteView(),
  ];
  const HomeScreen({super.key, required this.childView,  this.pageIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body:  childView,
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomButtomNavigation( currentIndex: pageIndex ),
    );
  }
}

