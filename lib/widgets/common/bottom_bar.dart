import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/friends/friends.dart';
import 'package:haruapp/pages/main/home/home.dart';
import 'package:haruapp/pages/main/my/my.dart';
import 'package:haruapp/pages/main/setting/setting.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _items = [
    BottomNavigationBarItem(
      title: Text('MY', style: TextStyle(fontSize: 20)),
      icon: Icon(
        Icons.home,
        size: 25,
        color: Colors.black,
      ),
    ),
    BottomNavigationBarItem(
      title: Text('MY', style: TextStyle(fontSize: 20, color: Colors.black)),
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      title: Text('MY', style: TextStyle(fontSize: 20)),
      icon: Icon(
        Icons.people,
        size: 25,
        color: Colors.black,
      ),
    ),
    BottomNavigationBarItem(
      title: Text('MY', style: TextStyle(fontSize: 20)),
      icon: Icon(
        Icons.settings,
        size: 25,
        color: Colors.black,
      ),
    ),
  ];
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: _items,
        ),
      ),
      children: <Widget>[HomePage(), MyPage(), FriendsPage(), SettingPage()],
      onItemTap: (index) {},
    );
  }
}
