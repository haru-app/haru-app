import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 60,
        child: TabBar(
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black26,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
            ),
            Tab(
              child: Text(
                "MY",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Tab(
              icon: Icon(
                Icons.people,
                size: 25,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
