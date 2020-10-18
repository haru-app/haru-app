import 'package:flutter/material.dart';

class DiaryItem extends StatelessWidget {
  dynamic _diary;
  int _userIdx;
  DiaryItem(diary, {int userIdx}) {
    _diary = diary;
    _userIdx = userIdx;
  }

  @override
  Widget build(BuildContext context) {
    var _setColor = Colors.black45;
    return GestureDetector(
      onTap: () {
        if (_userIdx == null) {
          Navigator.pushNamed(context, '/main/my/diary',
              arguments: {'diary': _diary});
          return;
        }
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.import_contacts,
              size: 75,
              color: _setColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _diary['diaryName'],
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
