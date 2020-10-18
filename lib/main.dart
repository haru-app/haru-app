import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:haruapp/pages/router.dart';
import 'package:haruapp/providers/diary.dart';
import 'package:haruapp/providers/page.dart';
import 'package:haruapp/providers/code.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:haruapp/providers/user.dart';
import 'package:haruapp/services/auth.dart';
import 'package:haruapp/utils/config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config().loadConfig();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
          ChangeNotifierProvider<CodeProvider>(create: (_) => CodeProvider()),
          ChangeNotifierProvider<SubPageProvider>(
              create: (_) => SubPageProvider()),
          ChangeNotifierProvider<PageProvider>(create: (_) => PageProvider()),
          ChangeNotifierProvider<DiaryProvider>(create: (_) => DiaryProvider())
        ],
        child: MaterialApp(
          title: 'Haru',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.white,
            accentColor: Colors.black,
            //          primarySwatch: Colors.blue,
          ),
          initialRoute: '/login',
          routes: routes,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate
          ],
          supportedLocales: [
            const Locale('ko', 'KR'),
            const Locale('en', 'US'),
          ],
        ));
  }
}
