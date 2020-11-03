import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/pages/main/friends/friends_view.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:haruapp/services/user.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";
  dynamic userList = [];

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
        UserService userService = UserService(context: context);
        userService.getUserList(searchText: _searchText).then((dynamic value) {
          setState(() {
            userList = value;
            print(userList);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: TextFormField(
                        focusNode: focusNode,
                        style: TextStyle(fontSize: 15),
                        autofocus: true,
                        controller: _filter,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white12,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            suffixIcon: focusNode.hasFocus
                                ? IconButton(
                                    icon: Icon(
                                      Icons.cancel,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _filter.clear();
                                        _searchText = '';
                                      });
                                    },
                                  )
                                : Container(),
                            hintText: '검색',
                            labelStyle: TextStyle(color: Colors.black),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    ),
                    focusNode.hasFocus
                        ? Expanded(
                            child: FlatButton(
                              child: Text(
                                '취소',
                                style: TextStyle(fontSize: 13),
                              ),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          )
                        : Expanded(
                            flex: 0,
                            child: Container(),
                          )
                  ],
                ),
              ),
              Container(
                  child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _UserList(userList[index]),
                          Divider(),
                        ],
                      );
                    }),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class _UserList extends StatelessWidget {
  dynamic userList;
  _UserList(userList) {
    this.userList = userList;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/main/friends/view/diary',
            arguments: <dynamic, dynamic>{'friends': userList});
      },
      child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: Text(
                userList['username'],
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(
                Icons.account_circle,
                size: 38,
              ),
              trailing: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
