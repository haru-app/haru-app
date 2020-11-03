import 'package:flutter/material.dart';

enum SubPage {
  myDiaryList,
  myDiary,
  friendsList,
  friendsView,
  friendsDiary,
  searchScreen
}

class SubPageProvider with ChangeNotifier {
  SubPage _page;
  dynamic _data;

  SubPage get page => _page;
  set page(SubPage value) {
    _page = value;
    notifyListeners();
  }

  dynamic get data => _data;
  set data(dynamic data) {
    _data = data;
    notifyListeners();
  }

  setPage(SubPage value, dynamic data) {
    _page = value;
    _data = data;
    notifyListeners();
  }
}
