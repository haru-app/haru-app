import 'dart:convert';

import 'package:haruapp/utils/config.dart';
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
    print(this.uri(url, parameters).toString());
    return super.get(this.uri(url, parameters), headers: headers);
  }
}
