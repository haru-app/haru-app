import 'package:flutter/material.dart';
import 'package:haruapp/providers/my.dart';
import 'package:haruapp/widgets/my/my_diary_item.dart';
import 'package:provider/provider.dart';

class MyDiaryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyProvider myProvider = Provider.of<MyProvider>(context, listen: true);
    return FutureBuilder(
        future: myProvider.getDiaryList(context: context, isNotify: false),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()]);
          }
          return OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
              children: List.generate(myProvider.diaryList.length, (position) {
                return MyDiaryItem(myProvider.diaryList[position]);
              }),
            );
          });
        });
  }
}
