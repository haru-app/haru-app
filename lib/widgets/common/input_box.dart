import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

enum InputType { INT, STRING, DOUBLE, DATE, TIME, DATETIME }

class InputBox extends StatefulWidget {
  final TextEditingController _controller = TextEditingController();
  final _formFieldKey = GlobalKey<FormFieldState>();

  String _name;
  InputType _inputType;
  DateTime _dateTime;
  TimeOfDay _time;
  Function _validator;
  bool _obscureText;

  InputBox(
      {@required String name,
      @required InputType inputType,
      Function validator,
      bool obscureText}) {
    this._name = name;
    this._inputType = inputType;
    this._validator = validator;
    this._obscureText = obscureText == null ? false : obscureText;
  }

  dynamic get value {
    if (_inputType == InputType.INT)
      return int.tryParse(_controller.text) == null
          ? null
          : int.parse(_controller.text);
    else if (_inputType == InputType.DOUBLE)
      return double.tryParse(_controller.text) == null
          ? null
          : double.parse(_controller.text);
    else if (_inputType == InputType.DATE || _inputType == InputType.DATETIME)
      return _dateTime;
    else if (_inputType == InputType.TIME) return _time;
    return _controller.text;
  }

  set value(value) {
    _controller.text = value;
  }

  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  String _errorText;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    this.widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: this.widget._formFieldKey,
      enableInteractiveSelection: this.widget._inputType == InputType.DATE ||
              this.widget._inputType == InputType.TIME ||
              this.widget._inputType == InputType.DATETIME
          ? false
          : true,
      onTap: onTap,
      controller: this.widget._controller,
      validator: this.widget._validator,
      decoration: InputDecoration(
          labelText: this.widget._name,
          hintText: '입력하세요',
          errorText: _errorText),
      obscureText: this.widget._obscureText,
      onChanged: (String value) {
        String newString;

        switch (this.widget._inputType) {
          case InputType.INT:
            newString = intFormatter(value);
            break;
          case InputType.DOUBLE:
            newString = doubleFormatter(value);
            break;
          default:
            newString = value;
            break;
        }

        if (value != newString) {
          this.widget._controller.text = newString;
          this.widget._controller.selection = TextSelection.fromPosition(
              TextPosition(offset: this.widget._controller.text.length));
        }

        if (this.widget._validator != null) {
          this.widget._formFieldKey.currentState.validate();
        }
      },
      keyboardType: this.widget._inputType == InputType.INT ||
              this.widget._inputType == InputType.DOUBLE
          ? TextInputType.number
          : TextInputType.text,
    );
  }

  String intFormatter(String value) {
    return value.replaceAllMapped(RegExp(r'\D+'), (match) {
      return '';
    });
  }

  String doubleFormatter(String value) {
    final result = RegExp(r'\d+(?:\.+)?(?:\d+)?').stringMatch(value);
    return result == null ? '' : result;
  }

  void onTap() async {
    if (this.widget._inputType == InputType.DATE ||
        this.widget._inputType == InputType.TIME ||
        this.widget._inputType == InputType.DATETIME) {
      FocusScope.of(context).requestFocus(new FocusNode());

      if (this.widget._inputType == InputType.DATE) {
        DateTime dateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2030),
        );
        if (dateTime == null) return;
        this.widget._dateTime = dateTime;
        this.widget._controller.text =
            DateFormat('yyyy-MM-dd').format(dateTime);
      } else if (this.widget._inputType == InputType.TIME) {
        TimeOfDay time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (time == null) return;
        this.widget._time = time;
        this.widget._controller.text = time.format(context);
      } else if (this.widget._inputType == InputType.DATETIME) {
        DateTime dateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2030),
        );
        if (dateTime == null) return;
        TimeOfDay time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (time == null) return;
        dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
            time.hour, time.minute);
        this.widget._dateTime = dateTime;
        this.widget._controller.text =
            DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
      }
    }
  }
}
