import 'package:flutter/material.dart';
import 'package:haruapp/services/auth/login_service.dart';
import 'package:haruapp/utils/http_client.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'HARU',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Text(
                '나만의 일기장을 작성하고 원하는 일기는 공유하세요',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password Confirm'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Username'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Birthday'),
                  )
                ],
              )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  LoginService().login('test', 'test');
                },
                color: Colors.blue,
                child: Text(
                  '회원가입',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  '계정이 이미 있으신가요?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
