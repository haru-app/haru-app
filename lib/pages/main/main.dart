import 'package:flutter/material.dart';
import 'file:///C:/Users/home/Desktop/haru_app/lib/pages/main/my/my.dart';
import 'file:///C:/Users/home/Desktop/haru_app/lib/pages/main/friends/friends_list.dart';
import 'file:///C:/Users/home/Desktop/haru_app/lib/pages/main/home/home.dart';
import 'file:///C:/Users/home/Desktop/haru_app/lib/pages/main/setting/setting.dart';
import 'package:haruapp/widgets/common/bottom_bar.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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