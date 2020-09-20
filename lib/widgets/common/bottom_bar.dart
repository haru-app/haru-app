//import 'package:flutter/material.dart';
//import 'package:haruapp/pages/main/friends/friends_list.dart';
//import 'package:haruapp/pages/main/home/home.dart';
//import 'package:haruapp/pages/main/my/my.dart';
//import 'package:haruapp/pages/main/setting/setting.dart';
//
//void main() {
//  runApp(MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(home: BottomBar());
//  }
//}
//
//class BottomBar extends StatefulWidget {
//  @override
//  _BottomBarState createState() => _BottomBarState();
//}
//
//class _BottomBarState extends State<BottomBar> {
//  int _index = 0;
//  final List<Widget> _children = [
//    HomePage(),
//    MYPage(),
//    FriendsPage(),
//    SettingPage()
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _children[_index],
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            title: Text('MY', style: TextStyle(fontSize: 20)),
//            icon: Icon(
//              Icons.home,
//              size: 25,
//              color: Colors.black,
//            ),
//          ),
//          BottomNavigationBarItem(
//            title:
//                Text('MY', style: TextStyle(fontSize: 20, color: Colors.black)),
//            icon: Icon(Icons.home),
//          ),
//          BottomNavigationBarItem(
//            title: Text('MY', style: TextStyle(fontSize: 20)),
//            icon: Icon(
//              Icons.people,
//              size: 25,
//              color: Colors.black,
//            ),
//          ),
//          BottomNavigationBarItem(
//            title: Text('MY', style: TextStyle(fontSize: 20)),
//            icon: Icon(
//              Icons.settings,
//              size: 25,
//              color: Colors.black,
//            ),
//          ),
//        ],
//        onTap: (int index) {
//          setState(() {
//            _index = index;
//          });
//        },
//        currentIndex: _index,
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 60,
        child: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black26,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
            ),
            Tab(
              child: Text(
                "MY",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.people,
                size: 25,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
