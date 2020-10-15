import 'package:flutter/material.dart';
import 'package:haruapp/providers/code.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:http/src/response.dart';
import 'package:provider/provider.dart';

class FriendRequestService {
  BuildContext _context;
  HttpClient _apiClient;

  FriendRequestService({BuildContext context}) {
    this._context = context;
    this._apiClient = HttpClient(type: 'api', context: _context);
  }

  Future<dynamic> getFriendRequestList() async {
    ResponseResult result = await _apiClient.jsonGet('/friend/request');
    print(result.json.length);
    return result.json;
  }

  Future<dynamic> allowFriendRequest({int friendUserIdx}) async {
    ResponseResult result =
        await _apiClient.jsonPut('/friend/request/${friendUserIdx}');
    return result.json;
  }

  Future<dynamic> rejectFriendRequest({int friendUserIdx}) async {
    ResponseResult result =
        await _apiClient.jsonDelete('/friend/request/${friendUserIdx}');
    return result.json;
  }
}
