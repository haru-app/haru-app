import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/pages/auth/login.dart';
import 'package:haruapp/services/auth.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

import 'package:provider/provider.dart';
import 'package:haruapp/providers/user.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 55),
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.black38,
                      child: Icon(
                        Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                      //backgroundImage: AssetImage(''),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      Provider.of<UserProvider>(context, listen: false)
                          .username,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 15),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '프로필 수정',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {},
              child: Container(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.build,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '계정 설정',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: FlatButton(
              onPressed: () {
                _LogoutDialog(context);
              },
              child: Container(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '로그아웃',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _LogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Text("로그아웃 하시겠습니까?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("예"),
              onPressed: () {
                AuthService().logout().then((void _) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()),
                      (route) => false);
                });
              },
            ),
            new FlatButton(
              child: new Text("아니요"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
