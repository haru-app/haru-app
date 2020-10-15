import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:haruapp/pages/main/friends/friends_diary.dart';
import 'package:haruapp/pages/main/main.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:haruapp/services/friend.dart';
import 'package:haruapp/services/friend_request.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:haruapp/pages/main/setting/setting.dart';
import 'package:haruapp/widgets/common/bottom_bar.dart';
import 'package:provider/provider.dart';

import 'friends.dart';

class FriendsViewPage extends StatefulWidget {
  final dynamic friends;
  FriendsViewPage({Key key, @required this.friends}) : super(key: key);

  @override
  _FriendsViewPageState createState() => _FriendsViewPageState();
}

class _FriendsViewPageState extends State<FriendsViewPage> {
  dynamic friendList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FriendService friendService = FriendService(context: context);
    friendService
        .getCheckFriend(friendUserIdx: widget.friends['userIdx'])
        .then((dynamic value) {
      setState(() {
        friendList = [
          {'frienduseridx': 'null'},
          {'frienduseridx2': 'null'},
          {'useridx': 'null'},
          {'useridx2': 'null'}
        ];
        friendList = value;

        print('친구 요청리스트 : ');
        print(friendList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String username = widget.friends['username'];
    int useridx = widget.friends['userIdx'];

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
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: friendList.length,
                      itemBuilder: (context, index) {
                        return checkFriend(
                            friendList[index], username, useridx);
                      }),
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: friendsNoteList(context)),
              ],
            ),
          ),
        ),
      ),
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
    var subPage = Provider.of<SubPageProvider>(context, listen: true);
    dynamic data;

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
              onTap: () {
                subPage.setPage(SubPage.friendsDiary, data);
              },
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

class checkFriend extends StatelessWidget {
  dynamic friendList;
  String username = '';
  int userIdx = 0;
  String friendState = '';
  bool send = true;

  checkFriend(friendList, username, useridx) {
    this.friendList = friendList;
    this.username = username;
    this.userIdx = useridx;
  }

  checkFriendIdx() {
    if (friendList['useridx'] == null) {
      if (friendList['useridx2'] == null) {
        friendState = '친구 요청';
      }
      if (friendList['useridx2'] != null) {
        friendState = '친구 요청 받음';
      }
    } else if (friendList['useridx'] != null) {
      if (friendList['useridx2'] == null) {
        friendState = '친구 요청 보냄';
      }
      if (friendList['useridx2'] != null) {
        friendState = '친구 삭제';
      }
    }
    return friendState;
  }

  @override
  Widget build(BuildContext context) {
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
                    username,
                    style: TextStyle(fontSize: 17),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(right: 27),
            child: GestureDetector(
                onTap: () {
                  if (friendState == '친구 요청') {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('친구 요청을 보내시겠습니까?'),
                            actions: [
                              RaisedButton(
                                child: Text('예'),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  if (send == true) {
                                    FriendRequestService friendRequestservice =
                                        FriendRequestService(context: context);
                                    await friendRequestservice
                                        .allowFriendRequest(
                                            friendUserIdx: userIdx);
                                    AlertBar(
                                            type: AlertType.success,
                                            message: '친구 요청이 전송되었습니다.',
                                            context: context)
                                        .show();
                                    send = false;
                                  } else if (send == false) {
                                    AlertBar(
                                            type: AlertType.error,
                                            message: '이미 전송되었습니다.',
                                            context: context)
                                        .show();
                                  }
                                },
                              ),
                              RaisedButton(
                                child: Text('아니요'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  } else if (friendState == '친구 요청 받음') {
                    AlertBar(
                            type: AlertType.success,
                            message: '이미 친구 요청을 받았습니다.',
                            context: context)
                        .show();
                  } else if (friendState == '친구 요청 보냄') {
                    AlertBar(
                            type: AlertType.success,
                            message: '이미 친구 요청을 보냈습니다.',
                            context: context)
                        .show();
                  } else if (friendState == '친구 삭제') {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('친구를 삭제하시겠습니까?'),
                            actions: [
                              RaisedButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  if (send == true) {
                                    AlertBar(
                                            type: AlertType.success,
                                            message: '친구가 삭제되었습니다.',
                                            context: context)
                                        .show();
                                    FriendService friendservice =
                                        FriendService(context: context);
                                    await friendservice.deleteFriend(
                                        friendUserIdx: userIdx);
                                    send = false;
                                  } else if (send == false) {
                                    AlertBar(
                                            type: AlertType.error,
                                            message: '이미 삭제되었습니다.',
                                            context: context)
                                        .show();
                                  }
                                },
                                child: Text('예'),
                              ),
                              RaisedButton(
                                child: Text('아니요'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  }
                },
                child: Text(
                  checkFriendIdx(),
                  style: TextStyle(color: Colors.blue),
                ))),
      ],
    );
  }
}
