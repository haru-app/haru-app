import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/my_page.dart';
import 'package:haruapp/pages/main/friends_list.dart';
import 'package:haruapp/pages/main/home_page.dart';
import 'package:haruapp/pages/main/setting.dart';
import 'package:haruapp/widgets/common/bottom_bar.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          accentColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: TopBar(),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              Stack(
                children: <Widget>[HomePage()],
              ),
              Stack(
                children: <Widget>[MYPage()],
              ),
              Stack(
                children: <Widget>[FriendsPage()],
              ),
              Stack(
                children: <Widget>[SettingPage()],
              )
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
