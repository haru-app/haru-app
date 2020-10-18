import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:haruapp/providers/diary.dart';
import 'package:haruapp/widgets/common/diary_item.dart';
import 'package:provider/provider.dart';

class DiaryList extends StatelessWidget {
  int _userIdx;

  DiaryList({int userIdx}) {
    _userIdx = userIdx;
  }

  @override
  Widget build(BuildContext context) {
    DiaryProvider diaryProvider =
        Provider.of<DiaryProvider>(context, listen: true);
    return FutureBuilder(
        future: diaryProvider.getDiaryList(context: context, isNotify: false),
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
              children:
                  List.generate(diaryProvider.diaryList.length, (position) {
                return DiaryItem(diaryProvider.diaryList[position]);
              }),
            );
          });
        });
  }
}
