import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/my_icons.dart';

import 'package:flutter_shop/screens/cart.dart';
import 'package:flutter_shop/screens/feeds.dart';
import 'package:flutter_shop/screens/home.dart';
import 'package:flutter_shop/screens/search.dart';
import 'package:flutter_shop/screens/user_info.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int initialIndex = 0;
  final _screens = [
    HomeScreen(),
    FeedsScreen(),
    SearchScreen(),
    CartScreen(),
    UserInfoScreen()
  ];
  void _onChangePage(index) {
    setState(() {
      initialIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[initialIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 1.28,
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey, width: .5),
                ),
                color: Colors.white),
            child: BottomNavigationBar(
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.blue,
              backgroundColor: Theme.of(context).backgroundColor,
              currentIndex: initialIndex,
              onTap: _onChangePage,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.rss),
                  label: "Feeds",
                ),
                BottomNavigationBarItem(
                  icon: Icon(null),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.cart), label: "Cart"),
                BottomNavigationBarItem(
                    icon: Icon(MyAppIcons.user), label: "User"),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          onPressed: () => _onChangePage(2),
          child: Icon(MyAppIcons.search),
          hoverElevation: 10,
          splashColor: Colors.red,
          tooltip: "Search",
          elevation: 4,
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
