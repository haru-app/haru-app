import 'package:flutter/material.dart';
import 'package:haruapp/providers/my.dart';
import 'package:provider/provider.dart';

class MyDiaryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context, listen: true);
    myProvider.getDiaryList(context: context, isNotify: false);
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
      return GridView.count(
        crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
        children: List.generate(myProvider.diaryList.length, (position) {
          return MyDiaryItem(myProvider.diaryList[position]);
        }),
      );
    });
  }
}

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
        Navigator.pushNamed(context, '/main/my/diary');
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
