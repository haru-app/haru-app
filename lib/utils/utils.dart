import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Utils {
  static Future<Map<String, dynamic>> loadJsonAsset(String assetPath) async {
    String data = await rootBundle.loadString('assets/' + assetPath);
    return json.decode(data);
  }
}
