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
    return AppBar(title: TopBarTitle(), actions: [
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
    ]);
  }
}
