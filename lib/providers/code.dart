import 'package:flutter/material.dart';

class CodeProvider with ChangeNotifier {
  dynamic _codes;

  dynamic get codes => _codes;

  set codes(dynamic codes) {
    _codes = codes;
    notifyListeners();
  }
}
