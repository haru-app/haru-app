import 'package:flutter/material.dart';
import 'package:haruapp/services/diary.dart';

class MyProvider with ChangeNotifier {
  dynamic _diaryList = [];

  dynamic get diaryList => _diaryList;
  set diaryList(dynamic value) {
    _diaryList = value;
    notifyListeners();
  }

  Future<void> getDiaryList({BuildContext context, isNotify = true}) async {
    DiaryService diaryService = DiaryService(context: context);
    print(isNotify);
    await diaryService.getDiaryList().then((dynamic value) {
      _diaryList = value;
      if (isNotify) notifyListeners();
    });
  }
}
