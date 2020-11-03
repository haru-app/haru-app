import 'package:flutter/material.dart';
import 'package:haruapp/providers/page.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: true);
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black38,
      currentIndex: pageProvider.currentIndex,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.home,
          ),
        ),
        BottomNavigationBarItem(
          label: 'MY',
          icon: Icon(
            Icons.account_circle,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Friends',
          icon: Icon(
            Icons.people,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Setting',
          icon: Icon(
            Icons.settings,
          ),
        ),
      ],
      onTap: (index) {
        pageProvider.currentIndex = index;
        if (!(new RegExp(r'^\/main\/.+\/.+')
            .hasMatch(ModalRoute.of(context).settings.name))) {
          pageProvider.pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.easeOut);
          return;
        }
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false,
            arguments: {'changePageIndex': index});
      },
    );
  }
}
