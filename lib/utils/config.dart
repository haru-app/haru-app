import 'package:haruapp/utils/utils.dart';

class Config {
  static final _instance = Config._internal();
  static Map<String, dynamic> _config;

  Config._internal();

  factory Config() {
    return _instance;
  }

  Future<void> loadConfig() async {
    Config._config = await Utils.loadJsonAsset('config/development.json');
  }

  static Map<String, dynamic> get() {
    return Config._config;
  }
}
