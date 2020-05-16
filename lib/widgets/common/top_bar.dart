import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/widgets/common/search.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 30, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'Haru',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print('asdfasdfasdf');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchScreen()));
                  },
                  child: Container(
                    child: Icon(
                      Icons.search,
                      size: 35,
                    ),
                    padding: EdgeInsets.only(right: 20),
                  ),
                ),
                Container(
                  child: Tab(
                    icon: Icon(
                      Icons.notifications,
                      size: 35,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
