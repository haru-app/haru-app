import 'package:flutter/material.dart';
import 'package:haruapp/pages/auth/login.dart';
import 'package:haruapp/pages/auth/register.dart';
import 'package:haruapp/pages/main/main.dart';
import 'package:haruapp/pages/main/my/my_diary.dart';

final routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/register': (BuildContext context) => RegisterPage(),
  '/main': (BuildContext context) => MainPage(),
  '/main/my/diary': (BuildContext context) => MyDiary(),
};
