import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/friends/friends_view.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 10, right: 24),
              child: GestureDetector(
                  onTap: () {
                    friendsReqDialog(context);
                  },
                  child: Text(
                    '친구 요청 확인',
                    style: TextStyle(fontSize: 17, color: Colors.blue),
                  )),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Scaffold(body: _friendsListView(context)),
            )
          ],
        ),
      ),
    ));
  }

  Widget _friendsListView(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        return GridView.count(
          padding: EdgeInsets.only(top: 15),
          crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
          children: List.generate(orientation == Orientation.portrait ? 15 : 10,
              (position) {
            return _friendsList(context);
          }),
        );
      }),
    );
  }

  Widget _friendsList(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => FriendsViewPage()));
      },
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black38,
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.white,
            ),
          ),
          Text(
            '이름',
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }

  void friendsReqDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: (Text('친구 요청 목록')),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                              '친구 1',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ButtonTheme(
                              disabledColor: Colors.blue,
                              minWidth: 50,
                              height: 30,
                              child: RaisedButton(
                                child: Text(
                                  '수락',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ButtonTheme(
                              disabledColor: Colors.red,
                              minWidth: 50,
                              height: 30,
                              child: RaisedButton(
                                child: Text(
                                  '거절',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                              '친구 2',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ButtonTheme(
                              disabledColor: Colors.blue,
                              minWidth: 50,
                              height: 30,
                              child: RaisedButton(
                                child: Text(
                                  '수락',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ButtonTheme(
                              disabledColor: Colors.red,
                              minWidth: 50,
                              height: 30,
                              child: RaisedButton(
                                child: Text(
                                  '거절',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                              '친구 3',
                              style: TextStyle(fontSize: 17),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ButtonTheme(
                              disabledColor: Colors.blue,
                              minWidth: 50,
                              height: 30,
                              child: RaisedButton(
                                child: Text(
                                  '수락',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            ButtonTheme(
                              disabledColor: Colors.red,
                              minWidth: 50,
                              height: 30,
                              child: RaisedButton(
                                child: Text(
                                  '거절',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  '닫기',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context, '닫기');
                },
              ),
            ],
          );
        });
  }
}
