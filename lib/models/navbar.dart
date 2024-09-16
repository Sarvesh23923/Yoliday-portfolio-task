// bottom_nav_bar.dart

import 'package:flutter/material.dart';
import 'package:portfolio/models/constants.dart'; // Ensure this file contains primaryColor

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? primaryColor : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.work,
            color: currentIndex == 1 ? primaryColor : Colors.grey,
          ),
          label: 'Portfolio',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.input,
            color: currentIndex == 2 ? primaryColor : Colors.grey,
          ),
          label: 'Input',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: currentIndex == 3 ? primaryColor : Colors.grey,
          ),
          label: 'Profile',
        ),
      ],
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.grey,
    );
  }
}
