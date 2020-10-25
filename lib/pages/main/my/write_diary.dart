import 'package:flutter/material.dart';
import 'package:haruapp/services/diary.dart';
import 'package:haruapp/utils/validator.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/icon_seek_bar.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';
import 'package:haruapp/widgets/my/my_write_diary_hash_tag.dart';
import 'package:haruapp/widgets/my/my_write_diary_top_bar.dart';

class WriteDiaryPage extends StatelessWidget {
  InputForm _inputForm;
  InputBox _writingDate;
  InputBox _title;
  InputBox _content;
  IconSeekBar _score;
  MyDiaryWritingTag _writingTag;
  @override
  Widget build(BuildContext context) {
    _inputForm = this.writeForm();

    return Scaffold(
        appBar: MyWriteDiaryTopBar(onWriting: () async {
          if (!this._inputForm.validate()) {
            AlertBar(
                    type: AlertType.error,
                    message: '입력하신 정보를 다시 한 번 확인해주세요.',
                    context: context)
                .show();
            return;
          }

          DiaryService diaryService = DiaryService(context: context);
          await diaryService.addWriting(
              (ModalRoute.of(context).settings.arguments as dynamic)['diary']
                  ['diaryIdx'],
              _writingDate.value,
              _title.value,
              _content.value,
              _score.value,
              _writingTag.value);
          Navigator.pop(context);
        }),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: _inputForm,
          ),
        ));
  }

  Widget writeForm() {
    _writingDate = InputBox(
      name: '날짜',
      inputType: InputType.DATE,
      validator: (String v) => Validator([vIsRequired()], v).validate(),
      lastDate: DateTime.now(),
    );
    _title = InputBox(
      name: '제목',
      inputType: InputType.STRING,
      validator: (String v) => Validator([vIsRequired()], v).validate(),
    );
    _content = InputBox(
        name: '내용',
        inputType: InputType.STRING_LINE,
        obscureText: false,
        validator: (String v) => Validator([vIsRequired()], v).validate(),
        isBorder: true,
        maxLine: 15);
    _score = IconSeekBar(
      icon: Icons.favorite,
      blankIcon: Icons.favorite_border,
      amount: 5,
      initialScore: 3,
    );
    _writingTag = MyDiaryWritingTag();

    return InputForm(
        child: Column(children: <Widget>[
      _writingDate,
      SizedBox(
        height: 25,
      ),
      _title,
      SizedBox(
        height: 25,
      ),
      _content,
      SizedBox(
        height: 25,
      ),
      _writingTag,
      SizedBox(
        height: 25,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '오늘 하루는 어땠나요? ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          _score
        ],
      )
    ]));
  }
}
