import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/my/my_diary_list.dart';

enum SubPage { myDiaryList, myDiary }

class SubPageProvider with ChangeNotifier {
  SubPage _page;

  SubPage get page => _page;

  set page(SubPage value) {
    _page = value;
    notifyListeners();
  }
}
