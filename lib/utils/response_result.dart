import 'package:http/http.dart';

class ResponseResult {
  final Response response;
  final Map<String, dynamic> json;
  ResponseResult(this.response, this.json);
}
