import 'package:flutter/material.dart';
import 'package:haruapp/pages/auth/login.dart';
import 'package:haruapp/pages/auth/register.dart';
import 'package:haruapp/pages/main/friends/friends_diary.dart';
import 'package:haruapp/pages/main/friends/friends_view.dart';
import 'package:haruapp/pages/main/main.dart';
import 'package:haruapp/pages/main/my/my_diary.dart';
import 'package:haruapp/widgets/common/notice_screen.dart';
import 'package:haruapp/widgets/common/search_screen.dart';
import 'package:haruapp/pages/main/my/write_diary.dart';

final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/register': (BuildContext context) => RegisterPage(),
  '/main': (BuildContext context) => MainPage(),
  '/main/my/diary': (BuildContext context) => MyDiaryPage(),
  '/main/friends/view/diary': (BuildContext context) => FriendsViewPage(),
  '/main/friends/diary': (BuildContext context) => FriendsDiary(),
  '/main/search': (BuildContext context) => SearchScreen(),
  '/main/notice': (BuildContext context) => NoticeScreen(),
  '/main/my/diary': (BuildContext context) => MyDiaryPage(),
  '/main/my/writeDiary': (BuildContext context) => WriteDiaryPage(),
};
