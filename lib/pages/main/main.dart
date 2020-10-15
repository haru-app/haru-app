import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/friends/friends_list.dart';
import 'package:haruapp/pages/main/home/home.dart';
import 'package:haruapp/pages/main/my/my.dart';
import 'package:haruapp/pages/main/setting/setting.dart';
import 'package:haruapp/widgets/common/bottom_bar.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:custom_navigator/custom_navigator.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BottomBar();
  }
}
