import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/top_bar.dart';

class FriendsPage extends StatefulWidget {
  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
          return GridView.count(
            padding: EdgeInsets.only(top: 25),
            crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
            children: List.generate(
                orientation == Orientation.portrait ? 12 : 10, (position) {
              return _Profile();
            }),
          );
        }),
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
}
