import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haruapp/pages/auth/login.dart';
import 'package:haruapp/pages/auth/register.dart';
import 'package:haruapp/pages/router.dart';
import 'package:haruapp/utils/config.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

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
      routes: routes,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
        const Locale('en', 'US'),
      ],
    );
  }
}
