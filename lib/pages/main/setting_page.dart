import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 60),
                  child: CircleAvatar(
                    radius: 70,
                    //backgroundImage: AssetImage(''),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    '이름',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                )
              ],
            ),
          ),
        ),
        ListTile(
          title: Text('프로필 정보 수정'),
          onTap: () {},
        ),
        ListTile(
          title: Text('로그인 정보 수정'),
          onTap: () {},
        ),
        ListTile(
          title: Text('로그아웃'),
          onTap: () {},
        ),
      ],
    );
  }
}
