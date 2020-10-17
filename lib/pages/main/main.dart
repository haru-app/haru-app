import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/home/home.dart';
import 'package:haruapp/pages/main/my/my.dart';
import 'package:haruapp/pages/main/setting/setting.dart';
import 'package:haruapp/providers/bottom_navigation.dart';
import 'package:haruapp/widgets/common/bottom_navigation.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:provider/provider.dart';

import 'friends/friends.dart';

class MainPage extends StatelessWidget {
  int _currentIndex = 0;
  PageController _pageController;

  MainPage() {
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final bottomNagivation =
        Provider.of<BottomNavigationProvider>(context, listen: true);
    _currentIndex = bottomNagivation.currentIndex;

    return Scaffold(
      appBar: AppBar(
        title: TopBar(),
      ),
      body: [HomePage(), MyPage(), FriendsPage(), SettingPage()][_currentIndex],
//      body: SizedBox.expand(
//        child: PageView(
//          controller: _pageController,
//          children: <Widget>[
//            HomePage(),
//            MyPage(),
//            FriendsPage(),
//            SettingPage()
//          ],
//        ),
//      ),
      bottomNavigationBar: BottomNavigation(pageController: _pageController),
    );
  }
}
