import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/bottom_navigation.dart';
import 'package:haruapp/widgets/common/writing.dart';
import 'package:haruapp/widgets/my/my_diary_top_bar.dart';

class MyDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyDiaryTopBar(),
      body: Writing(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
