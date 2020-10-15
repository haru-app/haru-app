import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/pages/main/friends/friends_view.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:haruapp/services/friend.dart';
import 'package:haruapp/services/friend_request.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:provider/provider.dart';

class FriendsListPage extends StatefulWidget {
  @override
  _FriendsListPageState createState() => _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
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
        appBar: AppBar(
          title: TopBar(),
        ),
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
    var subPage = Provider.of<SubPageProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        subPage.setPage(SubPage.friendsView, friend);
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

class FriendDialog extends StatefulWidget {
  @override
  _FriendDialogState createState() => _FriendDialogState();
}

class _FriendDialogState extends State<FriendDialog> {
  dynamic friendRequestList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FriendRequestService friendReqService =
        FriendRequestService(context: context);
    friendReqService.getFriendRequestList().then((dynamic value) {
      setState(() {
        friendRequestList = value;
        print('친구요청목록 : ');
        print(friendRequestList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: friendRequestList.length,
          itemBuilder: (context, index) {
            return _FriendsRequestListTile(friendRequestList[index]);
          }),
    );
  }
}

class _FriendsRequestListTile extends StatelessWidget {
  dynamic friendRequest;
  _FriendsRequestListTile(friendRequest) {
    if (friendRequest != Null) this.friendRequest = friendRequest;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text(
                      friendRequest['username'],
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    raisedButton(
                      friendRequest: friendRequest,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class raisedButton extends StatefulWidget {
  final dynamic friendRequest;
  raisedButton({Key key, @required this.friendRequest}) : super(key: key);
  @override
  _raisedButtonState createState() => _raisedButtonState();
}

class _raisedButtonState extends State<raisedButton> {
  bool isEnabled = true;

  disableButton() {
    setState(() {
      isEnabled = false;
    });
  }

  allowButton() async {
    FriendRequestService friendRequestservice =
        FriendRequestService(context: context);
    await friendRequestservice.allowFriendRequest(
        friendUserIdx: widget.friendRequest['userIdx']);
    AlertBar(type: AlertType.success, message: '수락되었습니다.', context: context)
        .show();
    disableButton();
  }

  rejectButton() async {
    FriendRequestService friendRequestservice =
        FriendRequestService(context: context);
    await friendRequestservice.rejectFriendRequest(
        friendUserIdx: widget.friendRequest['userIdx']);
    AlertBar(type: AlertType.error, message: '거절되었습니다.', context: context)
        .show();
    disableButton();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonTheme(
          disabledColor: Colors.blue,
          minWidth: 30,
          height: 25,
          child: RaisedButton(
            onPressed: isEnabled ? () => allowButton() : null,
            child: Text(
              '수락',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        ButtonTheme(
          buttonColor: Colors.red,
          minWidth: 30,
          height: 25,
          child: RaisedButton(
            onPressed: isEnabled ? () => rejectButton() : null,
            child: Text(
              '거절',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
