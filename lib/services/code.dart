import 'package:flutter/material.dart';
import 'package:haruapp/providers/code.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/response_result.dart';
import 'package:provider/provider.dart';

class CodeService {
  BuildContext _context;
  HttpClient _apiClient;

  CodeService({BuildContext context}) {
    this._context = context;
    this._apiClient = HttpClient(type: 'api', context: _context);
  }

  Future<void> fetchAllCode() async {
    ResponseResult result = await _apiClient.jsonGet('/code/all');
    final code = Provider.of<CodeProvider>(_context, listen: false);
    code.codes = result.json;
    print(code.codes);
  }
}
