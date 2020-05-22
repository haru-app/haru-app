import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MYPage extends StatefulWidget {
  @override
  _MYPageState createState() => _MYPageState();
}

class _MYPageState extends State<MYPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 5.0))),
          padding: EdgeInsets.only(top: 80, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black38,
                          child: Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 30,
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
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.import_contacts),
                      SizedBox(height: 10),
                      Text('스토리보드')
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.tune),
                      SizedBox(height: 10),
                      Text('필터 조회')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: GridView(
            children: <Widget>[
              SizedBox(
                width: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}

class _Note extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('');
      },
      child: Column(
        children: <Widget>[
          Icon(
            Icons.book,
            size: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '이름',
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
