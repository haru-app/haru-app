import 'package:flutter/material.dart';
import 'package:haruapp/services/auth/login_service.dart';
import 'package:haruapp/utils/http_client.dart';
import 'package:haruapp/utils/validator.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';

class RegisterPage extends StatelessWidget {
  InputForm _inputForm;
  InputBox _emailInput;
  InputBox _passwordInput;
  InputBox _passwordConfirmInput;
  InputBox _usernameInput;
  InputBox _birthdayInput;
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
                  _inputForm.validate();
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
    this._emailInput = InputBox(
      name: '이메일',
      inputType: InputType.STRING,
      validator: (String v) => Validator([vEmail()], v).validate(),
    );
    this._passwordInput = InputBox(
      name: '비밀번호',
      inputType: InputType.STRING,
      validator: (String v) => Validator([vPassword()], v).validate(),
      obscureText: true,
    );
    this._passwordConfirmInput = InputBox(
      name: '비밀번호 확인',
      inputType: InputType.STRING,
      validator: (String v) =>
          Validator([vPasswordConfirm(this._passwordInput.value)], v)
              .validate(),
      obscureText: true,
    );
    this._usernameInput = InputBox(
      name: '이름',
      inputType: InputType.STRING,
      validator: (String v) => Validator([vUsername()], v).validate(),
    );
    this._birthdayInput = InputBox(
      name: '생일',
      inputType: InputType.DATE,
      validator: (String v) => Validator([vIsRequired()], v).validate(),
    );
    return InputForm(
        child: Column(children: <Widget>[
      this._emailInput,
      SizedBox(
        height: 15,
      ),
      this._passwordInput,
      SizedBox(
        height: 15,
      ),
      this._passwordConfirmInput,
      SizedBox(
        height: 15,
      ),
      this._usernameInput,
      SizedBox(
        height: 15,
      ),
      this._birthdayInput,
    ]));
  }
}
