import 'package:flutter/material.dart';
import 'package:haruapp/widgets/common/input_box.dart';

class InputForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _child;

  InputForm({@required Widget child}) {
    this._child = child;
  }

  bool validate() {
    return this._formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: this._child,
    );
  }
}
