import 'package:flutter/material.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:provider/provider.dart';

import 'my_diary.dart';
import 'my_diary_list.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final subPage = Provider.of<SubPageProvider>(context, listen: true);

    Widget resultPage = Scaffold(
      body: Container(),
    );
    switch (subPage.page) {
      case SubPage.myDiaryList:
        resultPage = MyDiaryListPage();
        break;
      case SubPage.myDiary:
        resultPage = MyDiary();
        break;
      default:
        resultPage = MyDiaryListPage();
        break;
    }
    return resultPage;
  }
}

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }
//
// class _MyPageState extends State<MyPage> {
//   /*
//     MyDiaryList
//     MyDiary
//    */
//   SubPageProvider _subPage;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _subPage = Provider.of<SubPageProvider>(context, listen: true);
//     _subPage.page = SubPage.myDiaryList;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _subPage.build();
//   }
// }
