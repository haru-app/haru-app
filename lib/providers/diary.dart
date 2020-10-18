import 'package:flutter/material.dart';
import 'package:haruapp/services/diary.dart';

class DiaryProvider with ChangeNotifier {
  dynamic _diaryList = [];

  dynamic get diaryList => _diaryList;
  set diaryList(dynamic value) {
    _diaryList = value;
    notifyListeners();
  }

  Future<void> getDiaryList({BuildContext context, isNotify = true}) async {
    DiaryService diaryService = DiaryService(context: context);
    print(isNotify);
    dynamic value = await diaryService.getDiaryList();
    _diaryList = value;
    if (isNotify) notifyListeners();
    return value;
  }
}
