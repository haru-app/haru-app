import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/widgets/common/top_bar_title.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  TopBar({
    Key key,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            AuthService(context: context).updateToken();
          },
          child: Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'Haru',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.pushNamed(context, '/main/search');
                },
                iconSize: 40,
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.pushNamed(context, '/main/notice');
                },
                iconSize: 40,
              )
            ],
          ),
        )
      ],
    );
  }
}
