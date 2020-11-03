import 'package:flutter/material.dart';
import 'package:haruapp/providers/code.dart';
import 'package:haruapp/providers/diary.dart';
import 'package:haruapp/providers/user.dart';
import 'package:haruapp/services/diary.dart';
import 'package:haruapp/utils/config.dart';
import 'package:haruapp/utils/validator.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/dropdown_box.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
  bool checkBox = false;
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
                      GestureDetector(
                        onTap: () async {
                          checkBox = false;
                          showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) =>
                                  StatefulBuilder(builder:
                                      (BuildContext context,
                                          StateSetter setState) {
                                    return AlertDialog(
                                      title: Text(
                                        '스토리보드',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text('하루 일기장'),
                                                new Checkbox(
                                                    value: checkBox,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        print(value);
                                                        checkBox = value;
                                                      });
                                                    }),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('교환 일기장'),
                                                new Checkbox(
                                                  value: false,
                                                  onChanged: (bool value) {},
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('뉴 일기장'),
                                                new Checkbox(
                                                  value: false,
                                                  onChanged: (bool value) {},
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        FlatButton(
                                            child: Text('열기'),
                                            onPressed: () async {
                                              launch(
                                                  'http://${Config.get()['url']['api']['base'] + Config.get()['url']['api']['last']}/pdf');
                                              Navigator.pop(context);
                                            }),
                                        FlatButton(
                                            child: Text('닫기'),
                                            onPressed: () async {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    );
                                  }));
                        },
                        child: Icon(
                          Icons.bookmark_border,
                          size: 35,
                        ),
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
                  await diaryService.addDiary(
                      _nameInput.value, _publicRangeCode, _diaryIconCode);

                  Navigator.pop(context, '확인');
                  AlertBar(
                          type: AlertType.success,
                          message: '일기장을 추가했습니다.',
                          context: context)
                      .show();

                  final diaryProvider =
                      Provider.of<DiaryProvider>(context, listen: false);
                  diaryProvider.getDiaryList(context: context);
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
