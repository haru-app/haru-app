import 'package:flutter/material.dart';
import 'package:haruapp/pages/auth/login.dart';
import 'package:haruapp/utils/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config().loadConfig();
  print(Config.get());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
