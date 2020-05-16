import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('asdfasdf'),
      ),
    );
  }
}
//  final TextEditingController _filter = TextEditingController();
//  FocusNode focusNode = FocusNode();
//  String _searchText = "";
//
//  _SearchScreenState() {
//    _filter.addListener(() {
//      setState(() {
//        _searchText = _filter.text;
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//        children: <Widget>[
//          Container(
//            color: Colors.white,
//            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
//            child: Row(
//              children: <Widget>[],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
