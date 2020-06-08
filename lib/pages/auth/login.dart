import 'package:flutter/material.dart';
import 'package:haruapp/services/auth/auth.dart';
import 'package:haruapp/utils/validator.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';

class LoginPage extends StatelessWidget {
  InputForm _inputForm;
  InputBox _emailInput;
  InputBox _passwordInput;

  @override
  Widget build(BuildContext context) {
    this._inputForm = this.loginForm();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Column(
              children: <Widget>[
                Text(
                  'HARU',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                _inputForm,
                SizedBox(
                  height: 25,
                ),
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
                  onPressed: () async {
                    if (!this._inputForm.validate()) {
                      AlertBar(
                              type: AlertType.error,
                              message: '입력하신 정보를 다시 한 번 확인해주세요.',
                              context: context)
                          .show();
                      return;
                    }
                    if (!await AuthService(context: context).login(
                        this._emailInput.value, this._passwordInput.value))
                      return;
                    Navigator.pushReplacementNamed(context, '/main');
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
                    final result =
                        await Navigator.pushNamed(context, '/register');
                    if (result != null) {
                      print(result);
                      if (result == 'registerSuccess') {
                        AlertBar(
                                type: AlertType.success,
                                message: '성공적으로 회원가입이 되었습니다.',
                                context: context)
                            .show();
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
        ),
      ),
    );
  }

  InputForm loginForm() {
    this._emailInput = InputBox(
      name: '이메일',
      inputType: InputType.STRING,
      validator: (String v) =>
          Validator([vIsRequired(errorText: '이메일을 입력해주세요.')], v).validate(),
    );
    this._passwordInput = InputBox(
      name: '비밀번호',
      inputType: InputType.STRING,
      validator: (String v) =>
          Validator([vIsRequired(errorText: '비밀번호를 입력해주세요.')], v).validate(),
      obscureText: true,
    );
    return InputForm(
        child: Column(children: <Widget>[
      this._emailInput,
      SizedBox(
        height: 25,
      ),
      this._passwordInput,
    ]));
  }
}
