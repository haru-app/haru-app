import 'package:flutter/material.dart';

class IconSeekBar extends StatefulWidget {
  IconData _icon;
  IconData _blankIcon;
  int _amount;
  int score = 1;

  IconSeekBar(
      {IconData icon, IconData blankIcon, int amount, int initialScore = 0}) {
    _icon = icon;
    _blankIcon = blankIcon;
    _amount = amount;
    score = initialScore;
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
              widget.score = index + 1;
            });
          },
          child: Icon(
            widget.score > index ? widget._icon : widget._blankIcon,
            size: 35,
          ),
        );
      },
    ));
  }
}
