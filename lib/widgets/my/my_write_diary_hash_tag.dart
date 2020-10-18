import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';

class MyWriteDiaryHashTag extends StatefulWidget {
  List<String> hashTagList = [];
  @override
  _MyWriteDiaryHashTagState createState() => _MyWriteDiaryHashTagState();
}

class _MyWriteDiaryHashTagState extends State<MyWriteDiaryHashTag> {
  InputBox _input = InputBox(
    name: '#해쉬태그',
    inputType: InputType.STRING,
    isBorder: true,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(width: 150, height: 50, child: _input),
            SizedBox(
              width: 5,
            ),
            Container(
                color: Colors.black,
                child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        String hashTag = _input.value
                            .toString()
                            .replaceAll('#', '')
                            .replaceAll(' ', '_');
                        if (hashTag.length == 0) {
                          AlertBar(
                                  type: AlertType.error,
                                  context: context,
                                  message: '해쉬 태그를 입력하세요.')
                              .show();
                          return;
                        }
                        if (widget.hashTagList.indexOf(hashTag) != -1) {
                          AlertBar(
                                  type: AlertType.error,
                                  context: context,
                                  message: '이미 존재하는 해쉬태그 입니다.')
                              .show();
                          return;
                        }
                        widget.hashTagList.add(hashTag);
                        _input.value = '';
                      });
                    }))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 10,
            children: List<Widget>.generate(
                widget.hashTagList.length,
                (index) => Wrap(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          '#' + widget.hashTagList[index],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )))
      ],
    );
  }
}
