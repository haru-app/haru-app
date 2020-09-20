import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/widgets/common/dropdown_box.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';
import 'package:provider/provider.dart';
import 'package:haruapp/providers/user.dart';
import 'package:haruapp/services/diary.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.black12, width: 5.0),
                      bottom: BorderSide(color: Colors.black12, width: 5.0))),
              child: MyProfile(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: _MyNote(),
            )
          ],
        ),
      ),
    ));
  }
}

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String _value = 'S';
  String _iconValue = '0';
  InputForm _inputForm;
  InputBox _nameInput;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(18.0, 15.0, 9.0, 15.0),
          child: Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black38,
                    child: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    Provider.of<UserProvider>(context, listen: false).username,
                    style: TextStyle(fontSize: 17),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 18),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.bookmark_border,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.note_add,
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showAlertDialog(BuildContext context) async {
    String result = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _inputForm = this.nameInputForm();
          return AlertDialog(
            title: Text(
              '새 일기장 만들기',
              style: TextStyle(fontSize: 20),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _inputForm,
                  SizedBox(height: 30),
                  Text('최대 공개 범위'),
                  SizedBox(height: 5),
                  DropdownBox<String>(
                    items: [
                      DropdownMenuItem<String>(
                        child: Text('비공개'),
                        value: 'S',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('친구 공개'),
                        value: 'F',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('전체 공개'),
                        value: 'A',
                      )
                    ],
                    onChanged: (String value) {
                      setState(() {
                        _value = value;
                      });
                    },
                    value: _value,
                  ),
                  SizedBox(height: 20),
                  Text('아이콘 선택'),
                  SizedBox(height: 5),
                  DropdownBox<String>(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text('비공개'),
                          value: '0',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('친구 공개'),
                          value: '1',
                        ),
                        DropdownMenuItem<String>(
                          child: Text('전체 공개'),
                          value: '2',
                        )
                      ],
                      onChanged: (String value) {
                        setState(() {
                          _iconValue = value;
                        });
                      },
                      value: _iconValue)
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.pop(context, '확인');
                },
              ),
              FlatButton(
                child: Text('취소'),
                onPressed: () {
                  Navigator.pop(context, '취소');
                },
              )
            ],
          );
        });
  }

  InputForm nameInputForm() {
    this._nameInput = InputBox(
      name: '일기장 이름',
      inputType: InputType.STRING,
    );
    return InputForm(
      child: Column(
        children: <Widget>[
          this._nameInput,
          SizedBox(
            width: 3,
          )
        ],
      ),
    );
  }
}

class _MyNote extends StatefulWidget {
  @override
  _MyNote_State createState() => _MyNote_State();
}

class _MyNote_State extends State<_MyNote> {
  dynamic diaryList = [];

  @override
  void initState() {
    super.initState();

    DiaryService diaryService = DiaryService(context: context);
    diaryService.getDiaryList().then((dynamic value) {
      setState(() {
        diaryList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        return GridView.count(
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          crossAxisCount: orientation == Orientation.portrait ? 3 : 5,
          children: List.generate(diaryList.length, (position) {
            return _MyNoteBook(diaryList[position]);
          }),
        );
      }),
    );
  }
}

class _MyNoteBook extends StatelessWidget {
  dynamic diary;
  _MyNoteBook(diary) {
    this.diary = diary;
  }

  @override
  Widget build(BuildContext context) {
    var _setColor = Colors.black45;
    return GestureDetector(
      onTap: () {},
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
