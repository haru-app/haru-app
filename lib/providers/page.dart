import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/my/my_diary_list.dart';

class PageProvider with ChangeNotifier {
  int _currentIndex = 0;
  PageController _pageController;

  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  PageController get pageController => _pageController;
  set pageController(PageController value) {
    _pageController = value;
  }
}
