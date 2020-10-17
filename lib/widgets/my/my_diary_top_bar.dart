import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/services/auth.dart';
import 'package:haruapp/widgets/common/top_bar_title.dart';

class MyDiaryTopBar extends StatefulWidget implements PreferredSizeWidget {
  MyDiaryTopBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyDiaryTopBarState createState() => _MyDiaryTopBarState();
}

class _MyDiaryTopBarState extends State<MyDiaryTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TopBarTitle(),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_alt),
          onPressed: () {},
          iconSize: 40,
        ),
        PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return {'일기장 수정', '일기장 삭제', '멤버 추가'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(
              Icons.menu,
              size: 40,
            )),
      ],
    );
  }
}
