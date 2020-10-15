import 'package:flutter/material.dart';
import 'package:haruapp/providers/bottom_navigation.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final bottomNagivation =
        Provider.of<BottomNavigationProvider>(context, listen: true);
    _currentIndex = bottomNagivation.currentIndex;
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black38,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          label: 'Friends',
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Friends',
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Friends',
          icon: Icon(
            Icons.people,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Friends',
          icon: Icon(
            Icons.settings,
          ),
        ),
      ],
      onTap: (index) {
        bottomNagivation.currentIndex = index;
        if (!(new RegExp(r'^\/main\/.+\/.+')
            .hasMatch(ModalRoute.of(context).settings.name))) return;
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      },
    );
  }
}
