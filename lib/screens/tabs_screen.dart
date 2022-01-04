import 'package:flutter/material.dart';
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
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          onTap: selectTab,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
