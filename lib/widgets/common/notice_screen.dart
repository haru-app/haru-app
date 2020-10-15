import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

class NoticeScreen extends StatefulWidget {
  @override
  _NoticeScreenState createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TopBar()),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: _NoticeList(),
//                child: ListView.builder(
//                    scrollDirection: Axis.vertical,
//                    shrinkWrap: true,
//                    itemBuilder: (context, index) {
//                      return Column(
//                        mainAxisSize: MainAxisSize.min,
//                        children: [
//                          _NoticeList(),
//                          Divider(),
//                        ],
//                      );
//                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class _NoticeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => FriendsViewPage(
//                  friends: userList,
//                )));
        },
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(
                  '홍길동님이 좋아요를 눌렀습니다.',
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Text('5분전'),
                leading: Icon(
                  Icons.account_circle,
                  size: 38,
                ),
                trailing: Icon(Icons.more_horiz),
              )
            ],
          ),
        ),
      ),
    );
  }
}
