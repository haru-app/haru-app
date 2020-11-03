import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  String _username;
  Profile({String username = '이름'}) {
    _username = username;
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
                    _username,
                    style: TextStyle(fontSize: 17),
                  )
                ],
              )
            ],
          ),
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.only(right: 15),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.more_horiz,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
