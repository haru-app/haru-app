import 'package:flutter/material.dart';
import 'package:haruapp/pages/auth/register.dart';
import 'package:haruapp/services/auth/auth_service.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';

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
                      border: OutlineInputBorder(), labelText: 'Email'),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
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
              onPressed: () {
                AuthService().login('test', 'test');
              },
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
              onTap: () async {
                final result = await Navigator.pushNamed(context, '/register');
                if(result != null) {
                  print(result);
                  if(result == 'success') {
                    AlertBar(type: AlertType.success, message: '성공적으로 회원가입이 되었습니다.', context: context).show();
                  }

                }
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
