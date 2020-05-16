import 'package:haruapp/utils/http_client.dart';
import 'package:http/http.dart';

class LoginService {
  HttpClient httpClient;

  LoginService() {
    httpClient = HttpClient('api');
  }

  void login(String email, String password) async {
    final parameters = {'email': email, 'password': password};
    Response result =
        await httpClient.get('/auth/login', parameters: parameters);
    print(result.statusCode);
    print(result.body);
  }
}
