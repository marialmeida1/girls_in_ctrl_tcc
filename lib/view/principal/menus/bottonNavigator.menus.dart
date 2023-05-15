import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/view/principal/home/principal.home.dart';

class NavigationBarApp extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Principal(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Principal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: "Sobre",
          ),
        ],
      ),
    );
  }
}
