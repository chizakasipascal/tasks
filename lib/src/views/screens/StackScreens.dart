import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task/src/const/assets.dart';
import 'package:theme/theme.dart';

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
        backgroundColor: AppColors.inputBackgroundColor,
        elevation: 2.0,
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.chat,
              colorFilter: const ColorFilter.mode(
                  AppColors.textnavBarColorNoSelected, BlendMode.srcIn),
              semanticsLabel: 'Chats',
            ),
            activeIcon: SvgPicture.asset(
              Assets.chat,
              // colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
              semanticsLabel: 'Chats',
            ),
            label: 'Chat',
            tooltip: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.tasks,
              colorFilter: const ColorFilter.mode(
                  AppColors.textnavBarColorNoSelected, BlendMode.srcIn),
              semanticsLabel: 'tasks',
            ),
            activeIcon: SvgPicture.asset(
              Assets.tasks,
              colorFilter:
                  const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              semanticsLabel: 'Tasks',
            ),
            label: 'Tasks',
            tooltip: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.setting,
              colorFilter: const ColorFilter.mode(
                  AppColors.textnavBarColorNoSelected, BlendMode.srcIn),
              semanticsLabel: 'Settings',
            ),
            activeIcon: SvgPicture.asset(
              Assets.setting,
              colorFilter:
                  const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              semanticsLabel: 'Settings',
            ),
            label: 'Settings',
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SafeArea(child: _pages.elementAt(_selectedIndex)),
    );
  }
}
