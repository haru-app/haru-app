import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haruapp/providers/sub_page.dart';
import 'package:haruapp/utils/validator.dart';
import 'package:haruapp/widgets/common/alert_bar.dart';
import 'package:haruapp/widgets/common/dropdown_box.dart';
import 'package:haruapp/widgets/common/input_box.dart';
import 'package:haruapp/widgets/common/input_form.dart';
import 'package:haruapp/widgets/common/writing.dart';
import 'package:provider/provider.dart';
import 'package:haruapp/providers/user.dart';
import 'package:haruapp/services/diary.dart';
import 'package:haruapp/providers/code.dart';

class MyDiary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Writing());
  }
}
