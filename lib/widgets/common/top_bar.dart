import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/widgets/common/search_screen.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[Text('adsf'), Icon(Icons.book)],
        ),
      ),
    );
  }
}
