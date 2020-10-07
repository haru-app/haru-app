import 'package:flutter/material.dart';
import 'package:haruapp/services/friend_request.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';

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
