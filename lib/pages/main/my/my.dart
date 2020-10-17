import 'package:flutter/material.dart';
import 'package:haruapp/widgets/my/my_diary_list.dart';
import 'package:haruapp/widgets/my/my_profile.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.black12, width: 5.0),
                  bottom: BorderSide(color: Colors.black12, width: 5.0))),
          child: MyProfile(),
        ),
        Expanded(
          child: MyDiaryList(),
        )
      ],
    ));
  }
}
