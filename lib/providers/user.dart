import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _email;
  String _username;
  String _accessToken;
  String _refreshToken;

  String get email => _email;

  set email(String value) {
    _email = value;
    notifyListeners();
  }

  String get username => _username;

  set username(String value) {
    _username = value;
    notifyListeners();
  }

  String get refreshToken => _refreshToken;

  set refreshToken(String value) {
    _refreshToken = value;
  }

  String get accessToken => _accessToken;

  set accessToken(String value) {
    _accessToken = value;
  }
}
