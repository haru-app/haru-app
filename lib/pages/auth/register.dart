import 'package:flutter/material.dart';
import 'package:haruapp/services/auth/login_service.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';

class RegisterPage extends StatelessWidget {
  InputForm _inputForm;
  @override
  Widget build(BuildContext context) {
    _inputForm = this.registerForm();
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
              _inputForm,
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

  Widget registerForm() {
    return InputForm(
        child: Column(children: <Widget>[
      InputBox(
        name: 'email',
      ),
      SizedBox(
        height: 15,
      ),
      InputBox(
        name: 'Password',
      ),
      SizedBox(
        height: 15,
      ),
      InputBox(
        name: 'Password Confirm',
      ),
      SizedBox(
        height: 15,
      ),
      InputBox(
        name: 'Username',
      ),
      SizedBox(
        height: 15,
      ),
      InputBox(
        name: 'Birthday',
      )
    ]));
  }
}
