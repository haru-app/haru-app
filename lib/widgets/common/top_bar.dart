import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:haruapp/services/auth.dart';
//import 'package:haruapp/widgets/common/notice_screen.dart';
import 'package:haruapp/widgets/common/search_screen.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subPage = Provider.of<SubPageProvider>(context, listen: true);
    dynamic data;

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
