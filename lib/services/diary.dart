import 'dart:convert';

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

  Future<dynamic> getDiaryList({int userIdx}) async {
    //userIdx가 있으면 내꺼아닌거
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
    await _apiClient.jsonDelete('/diary/$diaryIdx');
  }

  Future<void> addWriting(int diaryIdx, DateTime writingDate, String title,
      String content, int score, List<String> writingTags) async {
    ResponseResult result = await _apiClient.jsonPost('/writing', body: {
      'diaryIdx': diaryIdx,
      'writingDate': writingDate,
      'title': title,
      'content': content,
      'score': score,
      'writingTags': writingTags
    });
    print(result.json);
  }

  Future<dynamic> getWritingList(int diaryIdx) async {
    ResponseResult result = await _apiClient
        .jsonGet('/writing', parameters: {'diaryIdx': diaryIdx});
    print(result.response.body);
    return result.json;
  }

  Future<dynamic> getWritingListAll() async {
    ResponseResult result = await _apiClient.jsonGet('/writing/all');
    print(result.response.body);
    return result.json;
  }
}
