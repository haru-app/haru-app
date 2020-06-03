import 'dart:convert';
import 'package:flutter/material.dart';
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

  Uri uri({String url, Map<String, String> parameters}) {
    if (!this._isHttps)
      return Uri.http(
          this._baseUrl, this._lastUrl + url, parameterConvertor(parameters));
    else
      return Uri.https(
          this._baseUrl, this._lastUrl + url, parameterConvertor(parameters));
  }

  Future<StreamedResponse> send(BaseRequest request) {
    request.headers['Content-Type'] = 'application/json; charset=utf-8';
    return this._client.send(request);
  }

  @override
  Future<Response> delete(url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) {
    return super.delete(
        this.uri(url: url, parameters: parameterConvertor(parameters)),
        headers: headers);
  }

  @override
  Future<Response> put(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.put(this.uri(url: url),
        headers: headers, body: parameterConvertor(body), encoding: encoding);
  }

  @override
  Future<Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) {
    return super.post(this.uri(url: url),
        headers: headers, body: parameterConvertor(body), encoding: encoding);
  }

  @override
  Future<Response> get(url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) {
    return super.get(
        this.uri(url: url, parameters: parameterConvertor(parameters)),
        headers: headers);
  }

  Future<ResponseResult> jsonDelete(String url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) async {
    Response response = await super.delete(
        this.uri(url: url, parameters: parameterConvertor(parameters)),
        headers: headers);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }

  Future<ResponseResult> jsonPut(String url,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Encoding encoding}) async {
    Response response = await super.put(this.uri(url: url),
        headers: headers,
        body: JsonEncoder().convert(parameterConvertor(body)),
        encoding: encoding);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }

  Future<ResponseResult> jsonPost(String url,
      {Map<String, String> headers,
      Map<String, dynamic> body,
      Encoding encoding}) async {
    Response response = await super.post(this.uri(url: url),
        headers: headers,
        body: JsonEncoder().convert(parameterConvertor(body)),
        encoding: encoding);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }

  Future<ResponseResult> jsonGet(String url,
      {Map<String, String> headers, Map<String, dynamic> parameters}) async {
    Response response = await super.get(
        this.uri(url: url, parameters: parameterConvertor(parameters)),
        headers: headers);
    Map<String, dynamic> json = jsonDecode(utf8.decode(response.bodyBytes));
    return ResponseResult(response, json);
  }

  Map<String, String> parameterConvertor(Map<String, dynamic> parameters) {
    if (parameters == null) return null;
    Map<String, String> convertParams = Map<String, String>();
    parameters.forEach((key, value) {
      if (value is TimeOfDay) {
        final now = new DateTime.now();
        convertParams[key] =
            DateTime(now.year, now.month, now.day, value.hour, value.minute)
                .toUtc()
                .toString();
      } else if (value is DateTime)
        convertParams[key] = value.toUtc().toString();
      else if (value is int)
        convertParams[key] = value.toString();
      else if (value is double)
        convertParams[key] = value.toString();
      else
        convertParams[key] = value;
    });
    print(convertParams);
    return convertParams;
  }
}
