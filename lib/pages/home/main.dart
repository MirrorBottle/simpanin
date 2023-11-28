// ignore_for_file: prefer_const_constructors

import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:simpanin/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    const HomeScreen(),
    const Center(child: Text("1")),
    const Center(child: Text("2")),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabItems[_selectedIndex],
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(UniconsLine.estate, size: 30, color: Colors.white),
            title: Text('Beranda',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            activeColor: Colors.white,
          ),
          FlashyTabBarItem(
            icon: Icon(UniconsLine.wrench, size: 30, color: Colors.white),
            title: Text('Maintenance',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            activeColor: Colors.white,
          ),
          FlashyTabBarItem(
            icon: Icon(UniconsLine.user_circle, size: 30, color: Colors.white),
            title: Text('Profil',
                style: TextStyle(color: Colors.white, fontSize: 16)),
            activeColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
