import 'package:http/http.dart';

class ResponseResult {
  final Response response;
  final dynamic json;
  ResponseResult(this.response, this.json);
}
