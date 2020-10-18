import 'package:flutter/material.dart';
import 'package:haruapp/providers/my.dart';
import 'package:haruapp/widgets/my/my_diary_item.dart';
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
