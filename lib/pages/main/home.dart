import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/setting_page.dart';
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
                  TopBar(),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text('MY'),
                    ),
                  ),
                  TopBar(),
                ],
              ),
              Stack(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text('Friend'),
                    ),
                  ),
                  TopBar(),
                ],
              ),
              Stack(
                children: <Widget>[
                  Setting_page(),
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
