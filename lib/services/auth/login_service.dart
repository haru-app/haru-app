import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:http/http.dart';

class LoginService {
  HttpClient httpClient;

  LoginService() {
    httpClient = HttpClient('api');
  }

  void login(String email, String password) async {
    final parameters = {'email': email, 'password': password};
    ResponseResult result =
        await httpClient.jsonGet('/auth/login', parameters: parameters);
    print(result.response.statusCode);
    print(result.json);
  }
}
