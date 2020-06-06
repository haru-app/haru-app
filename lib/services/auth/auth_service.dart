import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:http/http.dart';

class AuthService {
  AuthService() {}

  void login(String email, String password) async {
    final parameters = {'email': email, 'password': password};
    ResponseResult result =
        await HttpClient('api').jsonGet('/auth/login', parameters: parameters);
    print(result.response.statusCode);
    print(result.json);
  }

  void register(
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
        await HttpClient('api').jsonPost('/auth/register', body: body);
    print(result.response.statusCode);
    print(result.json);
  }
}
