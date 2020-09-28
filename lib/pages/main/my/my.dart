import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/utils/validator.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/dropdown_box.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';
import 'package:provider/provider.dart';
import 'package:haruapp/providers/user.dart';
import 'package:haruapp/services/diary.dart';
import 'package:haruapp/providers/code.dart';

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
  String _publicRangeCode;
  String _diaryIconCode;
  InputForm _inputForm;
  InputBox _nameInput;
  CodeProvider _code;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _code = Provider.of<CodeProvider>(context, listen: false);
      _publicRangeCode = _code.codes['array']['3'][0]['code'];
      _diaryIconCode = _code.codes['array']['2'][0]['code'];
    });
  }

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
                  Text('공개 범위'),
                  SizedBox(height: 5),
                  DropdownBox<String>(
                    items: List.generate(_code.codes['array']['3'].length,
                        (index) {
                      return DropdownMenuItem<String>(
                        child: Text(_code.codes['array']['3'][index]['name']),
                        value: _code.codes['array']['3'][index]['code'],
                      );
                    }),
                    onChanged: (String value) {
                      setState(() {
                        _publicRangeCode = value;
                      });
                    },
                    value: _publicRangeCode,
                  ),
                  SizedBox(height: 20),
                  Text('아이콘 선택'),
                  SizedBox(height: 5),
                  DropdownBox<String>(
                      items: List.generate(_code.codes['array']['2'].length,
                          (index) {
                        return DropdownMenuItem<String>(
                          child: Text(_code.codes['array']['2'][index]['name']),
                          value: _code.codes['array']['2'][index]['code'],
                        );
                      }),
                      onChanged: (String value) {
                        setState(() {
                          _diaryIconCode = value;
                        });
                      },
                      value: _diaryIconCode)
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('확인'),
                onPressed: () async {
                  if (!this._inputForm.validate()) {
                    AlertBar(
                            type: AlertType.error,
                            message: '입력하신 정보를 다시 한 번 확인해주세요.',
                            context: context)
                        .show();
                    return;
                  }
                  DiaryService diaryService =
                      new DiaryService(context: context);
                  print('hi');
                  await diaryService.addDiary(
                      _nameInput.value, _publicRangeCode, _diaryIconCode);
                  print('hi');
                  Navigator.pop(context, '확인');
                  AlertBar(
                          type: AlertType.success,
                          message: '일기장을 추가했습니다.',
                          context: context)
                      .show();
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
      validator: (String v) => Validator([(vIsRequired())], v).validate(),
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
    print(diary['diaryName']);
  }

  @override
  Widget build(BuildContext context) {
    var _setColor = Colors.black45;
    print(diary);
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
