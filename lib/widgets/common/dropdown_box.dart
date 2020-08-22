import 'package:flutter/material.dart';

class DropdownBox<T> extends StatefulWidget {
  List<DropdownMenuItem<T>> _items;
  Function _onChanged;
  T _value;

  DropdownBox({List<DropdownMenuItem<T>> items, Function onChanged, T value}) {
    _items = items;
    _onChanged = onChanged;
    _value = value;
  }

  @override
  _DropdownBoxState createState() => _DropdownBoxState<T>();
}

class _DropdownBoxState<T> extends State<DropdownBox> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      items: widget._items,
      onChanged: (value) {
        setState(() {
          widget._value = value;
        });
        widget._onChanged(value);
      },
      value: widget._value,
    );
  }
}
