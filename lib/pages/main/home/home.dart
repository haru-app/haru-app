import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.black12, width: 5.0),
                          bottom:
                              BorderSide(color: Colors.black12, width: 5.0))),
                  child: _HomeProfile()),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeProfile extends StatelessWidget {
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
                    '이름',
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

//Container(
//padding: EdgeInsets.only(left: 10, right: 10),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Container(
//child: Row(
//children: <Widget>[
//Icon(
//Icons.thumb_up,
//size: 20,
//),
//SizedBox(
//width: 10,
//),
//Text('좋아요 ' + '10개'),
//],
//)),
//Container(
//child: Text('댓글 10개'),
//)
//],
//),
//),
