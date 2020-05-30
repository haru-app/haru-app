import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  final TextEditingController _controller = TextEditingController();
  String _name;

  TextEditingController get controller {
    return _controller;
  }

  InputBox({
    @required String name,
  }) {
    this._name = name;
  }

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  void dispose() {
    this.widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: this.widget._name),
    );
  }
}
