import 'package:flutter/material.dart';
import 'package:haruapp/services/diary.dart';

class WritingProvider with ChangeNotifier {
  dynamic _writingList = [];

  dynamic get writingList => _writingList;
  set writingList(dynamic value) {
    _writingList = value;
    notifyListeners();
  }

  Future<void> getWritingList(
      {BuildContext context, diaryIdx, isNotify = true}) async {
    DiaryService diaryService = DiaryService(context: context);
    print(isNotify);
    dynamic value = await diaryService.getWritingList(diaryIdx);
    _writingList = value;
    if (isNotify) notifyListeners();
    return value;
  }

  Future<void> getWritingListAll(
      {BuildContext context, isNotify = true}) async {
    DiaryService diaryService = DiaryService(context: context);
    print(isNotify);
    dynamic value = await diaryService.getWritingListAll();
    _writingList = value;
    if (isNotify) notifyListeners();
    return value;
  }
}
