import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/providers/diary.dart';
import 'package:haruapp/services/auth.dart';
import 'package:haruapp/services/diary.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/top_bar_title.dart';
import 'package:provider/provider.dart';

class MyDiaryTopBar extends StatefulWidget implements PreferredSizeWidget {
  MyDiaryTopBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _MyDiaryTopBarState createState() => _MyDiaryTopBarState();
}

class _MyDiaryTopBarState extends State<MyDiaryTopBar> {
  @override
  Widget build(BuildContext context) {
    final diary =
        (ModalRoute.of(context).settings.arguments as dynamic)['diary'];

    final diaryProvider = Provider.of<DiaryProvider>(context, listen: false);
    diaryProvider.getDiaryList(context: context, isNotify: false);

    return AppBar(
      title: TopBarTitle(),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_alt),
          onPressed: () {},
          iconSize: 40,
        ),
        PopupMenuButton<String>(
            onSelected: (value) async {
              DiaryService diaryService = DiaryService(context: context);
              switch (value) {
                case '일기장 삭제':
                  await diaryService.removeDiary(diary['diaryIdx']);
                  Navigator.pop(context);
                  AlertBar(
                          type: AlertType.success,
                          message: '일기장을 삭제했습니다.',
                          context: context)
                      .show();
                  diaryProvider.getDiaryList(context: context);
                  break;
                case '멤버 관리':
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                            '멤버 관리',
                            style: TextStyle(fontSize: 20),
                          ),
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Container(
                                      child: InputBox(
                                        name: '이메일',
                                      ),
                                      width: 230,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text('기훈 (kwhoon@naver.com)\n[수락 대기중]'),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('장준수 (asde@naver.com)'),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('김우빈 (kwebbeb@naver.com)'),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                                child: Text('닫기'),
                                onPressed: () async {
                                  Navigator.pop(context);
                                })
                          ],
                        );
                      });
              }
            },
            itemBuilder: (BuildContext context) {
              return {'일기장 수정', '일기장 삭제', '멤버 관리'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(
              Icons.menu,
              size: 40,
            )),
      ],
    );
  }
}
