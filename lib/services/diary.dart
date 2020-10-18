import 'package:flutter/material.dart';
import 'package:haruapp/providers/code.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:provider/provider.dart';

class DiaryService {
  BuildContext _context;
  HttpClient _apiClient;

  DiaryService({BuildContext context}) {
    this._context = context;
    this._apiClient = HttpClient(type: 'api', context: _context);
  }

  Future<dynamic> getDiaryList() async {
    ResponseResult result = await _apiClient.jsonGet('/diary');
    return result.json;
  }

  Future<void> addDiary(
      String diaryName, String publicRangeCode, String diaryIconCode) async {
    print('request');
    ResponseResult result = await _apiClient.jsonPost('/diary', body: {
      'diaryName': diaryName,
      'publicRangeCode': publicRangeCode,
      'diaryIconCode': diaryIconCode
    });
    print('request');
  }

  Future<void> removeDiary(int diaryIdx) async {
    ResponseResult result = await _apiClient.jsonDelete('/diary/$diaryIdx');
  }
}
