import 'package:flutter/material.dart';
import 'package:haruapp/providers/code.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:provider/provider.dart';

class UserService {
  BuildContext _context;
  HttpClient _apiClient;

  UserService({BuildContext context}) {
    this._context = context;
    this._apiClient = HttpClient(type: 'api', context: _context);
  }

  Future<dynamic> getUserList({String searchText}) async {
    final parameters = {
      'searchText': searchText,
    };
    ResponseResult result =
        await _apiClient.jsonGet('/user/search', parameters: parameters);
    return result.json;
  }
}
