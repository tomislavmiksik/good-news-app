import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/appbars/categories_appbar.dart';
import 'package:news_app/appbars/home_appbar.dart';
import 'package:news_app/appbars/profile_appbar.dart';
import 'package:news_app/screens/categories_screen.dart';
import 'package:news_app/screens/profile_screen.dart';

import 'home_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<TabsScreen> {
  int _selectedIndex = 0;
  late List<dynamic> pages = [];
  late List<dynamic> appBars = [];
  
  @override
  void initState() {
    pages = [
      HomeScreen(),
      CategoriesScreen(),
      ProfileScreen(),
    ];
    appBars = [
      HomeAppBar(
        key: Key('home'),
      ),
      CategoriesAppBar(
        key: Key('categories'),
      ),
      ProfileAppBar(
        key: Key('profile'),
      ),
    ];
    super.initState();
  }

  void selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03071e),
      appBar: appBars[_selectedIndex],
      body: pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF03071e),
        type: BottomNavigationBarType.fixed,
        onTap: selectTab,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: const IconThemeData(
          color: Colors.white,
        ),
        selectedIconTheme: const IconThemeData(
          color: Color(0xFff77f00),
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage('assets/images/geoff.jpg'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
