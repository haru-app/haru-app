import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/friends/friends_view.dart';
import 'package:haruapp/services/friend.dart';
import 'package:haruapp/pages/main/friends/friends_requestDialog.dart';
import 'package:haruapp/services/friend_request.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  dynamic friendList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FriendService friendService = FriendService(context: context);
    friendService.getFriendList().then((dynamic value) {
      setState(() {
        friendList = value;
        print('친구목록 : ');
        print(friendList);
      });
    });
  }

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

  void friendsReqDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: (Text('친구 요청 목록')),
            content: SingleChildScrollView(
              child: FriendDialog(),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  '닫기',
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Widget _friendsListView(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        return GridView.count(
          padding: EdgeInsets.only(top: 15),
          crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
          children: List.generate(friendList.length, (position) {
            print(friendList[position]);
            return _FriendsList(friendList[position]);
          }),
        );
      }),
    );
  }
}

class _FriendsList extends StatelessWidget {
  dynamic friend;
  _FriendsList(friend) {
    this.friend = friend;
    print(friend['userIdx']);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FriendsViewPage(
                      friends: friend,
                    )));
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
            friend['username'],
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}
