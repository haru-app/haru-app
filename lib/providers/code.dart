import 'package:flutter/material.dart';

class CodeProvider with ChangeNotifier {
  Map<String, dynamic> _codes;

  Map<String, dynamic> get codes => _codes;

  set codes(Map<String, dynamic> codes) {
    _codes = codes;
    notifyListeners();
  }
}
