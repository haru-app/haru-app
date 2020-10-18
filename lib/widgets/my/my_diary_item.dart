import 'package:flutter/material.dart';

class MyDiaryItem extends StatelessWidget {
  dynamic diary;

  MyDiaryItem(diary) {
    this.diary = diary;
  }

  @override
  Widget build(BuildContext context) {
    var _setColor = Colors.black45;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/main/my/diary',
            arguments: {'diary': diary});
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
              diary['diaryName'],
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
