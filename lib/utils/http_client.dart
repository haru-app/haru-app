import 'dart:convert';
import 'package:haruapp/utils/config.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:http/http.dart';

class HttpClient extends BaseClient {
  final Client _client = Client();
  final String _type;
  String _baseUrl;
  String _lastUrl;
  bool _isHttps;

  HttpClient(this._type) {
    this._baseUrl = Config.get()['url'][_type]['base'];
    this._lastUrl = Config.get()['url'][_type]['last'];
    this._isHttps = Config.get()['url'][_type]['isHttps'];
  }

  Uri uri(url, parameters) {
    if (!this._isHttps)
      return Uri.http(this._baseUrl, this._lastUrl + url, parameters);
    else
      return Uri.https(this._baseUrl, this._lastUrl + url, parameters);
  }

  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Content-Type'] = 'application/json; charset=utf-8';
    return this._client.send(request);
  }

  @override
  Future<Response> delete(url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) {
    return super.delete(this.uri(url, parameters), headers: headers);
  }

  @override
  Future<Response> put(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.put(this._baseUrl + url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.post(this._baseUrl + url,
        headers: headers, body: body, encoding: encoding);
  }

  @override
  Future<Response> get(url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) {
    return super.get(this.uri(url, parameters), headers: headers);
  }

  Future<ResponseResult> jsonDelete(url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) async {
    Response response =
        await super.delete(this.uri(url, parameters), headers: headers);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }

  Future<ResponseResult> jsonPut(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    Response response = await super.put(this._baseUrl + url,
        headers: headers, body: body, encoding: encoding);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }

  Future<ResponseResult> jsonPost(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    Response response = await super.post(this._baseUrl + url,
        headers: headers, body: body, encoding: encoding);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }

  Future<ResponseResult> jsonGet(url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) async {
    Response response =
        await super.get(this.uri(url, parameters), headers: headers);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }
}
