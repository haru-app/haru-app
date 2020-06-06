import 'package:flutter/cupertino.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';

class AuthService {
  BuildContext _context;
  HttpClient _apiClient;
  AuthService({BuildContext context}) {
    this._context = context;
    this._apiClient = HttpClient(type: 'api', context: _context);
  }

  void login(String email, String password) async {
    final parameters = {'email': email, 'password': password};
    ResponseResult result =
        await _apiClient.jsonGet('/auth/login', parameters: parameters);
    print(result.response.statusCode);
    print(result.json);
  }

  Future<bool> register(
      {String email,
      String password,
      String username,
      DateTime birthday}) async {
    final body = {
      'email': email,
      'password': password,
      'username': username,
      'birthday': birthday
    };
    ResponseResult result =
        await _apiClient.jsonPost('/auth/register', body: body);

    if (result.response.statusCode == 200) return true;
    return false;
  }

  Future<bool> duplicateEmail({
    String email,
  }) async {
    final parameters = {
      'email': email,
    };
    ResponseResult result = await _apiClient.jsonGet('/user/email/duplicate',
        parameters: parameters);

    if (result.response.statusCode == 200 && result.json['isDuplicateEmail'])
      return true;
    return false;
  }
}
