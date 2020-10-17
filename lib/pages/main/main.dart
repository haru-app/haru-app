import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/home/home.dart';
import 'package:haruapp/pages/main/my/my.dart';
import 'package:haruapp/pages/main/setting/setting.dart';
import 'package:haruapp/providers/page.dart';
import 'package:haruapp/widgets/common/bottom_navigation.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:provider/provider.dart';

import 'friends/friends.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    int changePageIndex =
        (ModalRoute.of(context).settings.arguments as dynamic) != null
            ? (ModalRoute.of(context).settings.arguments
                as dynamic)['changePageIndex']
            : null;

    if (pageProvider.pageController == null) {
      pageProvider.pageController = PageController();
    } else if (changePageIndex != null) {
      if (pageProvider.pageController != null)
        pageProvider.pageController.dispose();
      pageProvider.pageController =
          PageController(initialPage: changePageIndex);
    }

    return Scaffold(
      appBar: TopBar(),
      // body: [HomePage(), MyPage(), FriendsPage(), SettingPage()][_currentIndex],
      body: SizedBox.expand(
        child: PageView(
          controller: pageProvider.pageController,
          onPageChanged: (value) {
            if (value != pageProvider.currentIndex) {
              pageProvider.currentIndex = value;
            }
          },
          children: <Widget>[
            HomePage(),
            MyPage(),
            FriendsPage(),
            SettingPage()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
