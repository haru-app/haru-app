import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/bottom_navigation.dart';
import 'package:haruapp/widgets/common/writing.dart';
import 'package:haruapp/widgets/my/my_diary_top_bar.dart';

class MyDiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyDiaryTopBar(),
      body: Writing(),
      bottomNavigationBar: BottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/main/my/writeDiary', arguments: {
            'diary':
                (ModalRoute.of(context).settings.arguments as dynamic)['diary']
          });
        },
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
