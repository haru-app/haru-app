import 'package:flutter/material.dart';

void main() {
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

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 40, left: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HARU',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey)),
                      labelText: 'Email'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey)),
                      labelText: 'Password'),
                )
              ],
            )),
            Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    print('비밀번호 찾기');
                  },
                  child: Text(
                    '비밀번호를 잊으셨나요?',
                    style: TextStyle(color: Colors.blue),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              color: Colors.blue,
              child: Text(
                '로그인',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                print('회원가입');
              },
              child: Text(
                '계정이 없으신가요?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
