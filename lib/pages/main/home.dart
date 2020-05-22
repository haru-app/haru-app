import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/MY_page.dart';
import 'package:haruapp/pages/main/friends_list.dart';
import 'package:haruapp/pages/main/setting.dart';
import 'package:haruapp/widgets/common/bottom_bar.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text('Home'),
                    ),
                  ),
                  //TopBar(),
                ],
              ),
              Stack(
                children: <Widget>[
                  //MYPage(),
                  //TopBar(),
                ],
              ),
              Stack(
                children: <Widget>[
                  FriendsPage(),
                  //TopBar(),
                ],
              ),
              Stack(
                children: <Widget>[
                  SettingPage(),
                  TopBar(),
                ],
              )
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
