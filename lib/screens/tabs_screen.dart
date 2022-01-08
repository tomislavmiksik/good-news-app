import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  @override
  void initState() {
    pages = [
      HomeScreen(),
      ProfileScreen(),
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
      backgroundColor: Color(0xFF03071e),
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Good News App',
          style: TextStyle(color: Colors.white),
        ),
        
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF03071e),
        type: BottomNavigationBarType.fixed,
        onTap: selectTab,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: Colors.white,
        ),
        selectedIconTheme: IconThemeData(
          color: Color(0xFff77f00),
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
