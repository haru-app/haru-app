import 'package:flutter/cupertino.dart';
import 'package:haruapp/providers/user.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  BuildContext _context;
  HttpClient _apiClient;
  AuthService({BuildContext context}) {
    this._context = context;
    this._apiClient = HttpClient(type: 'api', context: _context);
  }

  Future<bool> login(String email, String password) async {
    final parameters = {'email': email, 'password': password};
    ResponseResult result =
        await _apiClient.jsonGet('/auth/login', parameters: parameters);

    if (result.response.statusCode != 200) return false;

    final pref = await SharedPreferences.getInstance();
    pref.setString('accessToken', result.json['accessToken']);
    pref.setString('refreshToken', result.json['refreshToken']);

    final user = Provider.of<UserProvider>(_context, listen: false);
    user.email = result.json['email'];
    user.username = result.json['username'];
    user.accessToken = result.json['accessToken'];
    user.refreshToken = result.json['refreshToken'];

    return true;
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

    if (result.response.statusCode != 200) return false;
    return true;
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
