import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/top_bar.dart';
import 'package:haruapp/widgets/common/writing.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TopBar(),
        ),
        body: Writing());
  }
}
