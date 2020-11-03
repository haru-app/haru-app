import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/providers/diary.dart';
import 'package:haruapp/services/auth.dart';
import 'package:haruapp/services/diary.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/top_bar_title.dart';
import 'package:provider/provider.dart';

class MyWriteDiaryTopBar extends StatefulWidget implements PreferredSizeWidget {
  Function _onWriting;
  MyWriteDiaryTopBar({Key key, void onWriting()})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        _onWriting = onWriting,
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyDiaryTopBarState createState() => _MyDiaryTopBarState();
}

class _MyDiaryTopBarState extends State<MyWriteDiaryTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TopBarTitle(),
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: widget._onWriting,
          iconSize: 40,
        )
      ],
    );
  }
}
