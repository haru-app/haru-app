import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:haruapp/pages/main/main.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:haruapp/widgets/common/bottom_bar.dart';
import 'package:provider/provider.dart';
import 'package:haruapp/providers/user.dart';

class FriendsViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: TopBar(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.black12, width: 5.0),
                          bottom:
                              BorderSide(color: Colors.black12, width: 5.0))),
                  child: friendsProfile(context),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: friendsNoteList(context)),
              ],
            ),
          ),
        ),
        //bottomNavigationBar: MainPage(),
      ),
    );
  }

  Widget friendsProfile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(18.0, 15.0, 9.0, 15.0),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black38,
                    child: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    '친구 화면',
                    style: TextStyle(fontSize: 17),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 22),
          child: GestureDetector(
            onTap: () {
              friendsDialog(context);
            },
            child: Text(
              '친구 추가',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }

  void friendsDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Text('친구 요청이 전송되었습니다.'),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  '확인',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context, '확인');
                },
              ),
            ],
          );
        });
  }

  Widget friendsNoteList(BuildContext context) {
    var _setColor = Colors.black45;
    var _diaryDate = '2020-05-25';
    return SafeArea(
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        return GridView.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
          children: List.generate(orientation == Orientation.portrait ? 9 : 10,
              (position) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.import_contacts,
                      size: 75,
                      color: _setColor,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      _diaryDate,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}
