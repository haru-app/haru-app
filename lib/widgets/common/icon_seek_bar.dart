import 'package:flutter/material.dart';

class IconSeekBar extends StatefulWidget {
  IconData _icon;
  IconData _blankIcon;
  int _amount;
  int value = 1;

  IconSeekBar(
      {IconData icon, IconData blankIcon, int amount, int initialScore = 0}) {
    _icon = icon;
    _blankIcon = blankIcon;
    _amount = amount;
    value = initialScore;
  }

  @override
  _IconSeekBarState createState() => _IconSeekBarState();
}

class _IconSeekBarState extends State<IconSeekBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List<Widget>.generate(
      widget._amount,
      (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              widget.value = index + 1;
            });
          },
          child: Icon(
            widget.value > index ? widget._icon : widget._blankIcon,
            size: 35,
          ),
        );
      },
    ));
  }
}
