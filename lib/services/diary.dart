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
    print(result.json.length);
    return result.json;
  }
}
