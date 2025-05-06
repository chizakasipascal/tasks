import 'package:flutter/material.dart';

import 'screens.dart';

class Stackcreens extends StatefulWidget {
  const Stackcreens({super.key});

  @override
  State<Stackcreens> createState() => _StackcreensState();
}

class _StackcreensState extends State<Stackcreens> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _pages = <Widget>[
    ChatScreens(),
    TasksScreens(),
    SettingsScreens()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 2.0,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.data_exploration_outlined),
            activeIcon: Icon(Icons.data_exploration_rounded),
            label: 'Chat',
            tooltip: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu_rounded),
            activeIcon: Icon(Icons.history_edu_outlined),
            label: 'Tasks',
            tooltip: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            activeIcon: Icon(Icons.person_3_rounded),
            label: 'Settings',
            tooltip: 'Settings',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: kTextTabBarHeight,
        ),
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
