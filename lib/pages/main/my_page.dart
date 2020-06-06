import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MYPage extends StatefulWidget {
  @override
  _MYPageState createState() => _MYPageState();
}

class _MYPageState extends State<MYPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.black12, width: 5.0),
                      bottom: BorderSide(color: Colors.black12, width: 5.0))),
              child: _MYProfile(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _MYNote(),
            )
          ],
        ),
      ),
    ));
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '새 일기장 만들기',
              style: TextStyle(fontSize: 10),
            ),
            content: Text(""),
            actions: <Widget>[FlatButton(), FlatButton()],
          );
        });
  }
}

class _MYProfile extends StatelessWidget {
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
        Container(
          padding: EdgeInsets.only(right: 18),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.bookmark_border,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.note_add,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MYNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        return GridView.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
          children: List.generate(orientation == Orientation.portrait ? 9 : 10,
              (position) {
            return _MYNoteBook();
          }),
        );
      }),
    );
  }
}

class _MYNoteBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _setColor = Colors.red;
    var _diaryDate = '2020-05-25';
    return GestureDetector(
      onTap: () {
        print('asdasd');
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
  }
}
