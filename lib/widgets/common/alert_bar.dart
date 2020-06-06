import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum AlertType {
  info,
  error,
  success
}

class AlertBar {
  AlertType _type;
  String _message;
  Flushbar _flushbar;
  BuildContext _context;

  AlertBar({@required AlertType type, String message, BuildContext context}){
    this._type = type;
    this._message = message;
    this._context = context;
    this._flushbar = _createFlushbar();
  }

  Flushbar _createFlushbar() {
    Map<String, Color> color = Map<String, Color>();

    switch(this._type) {
      case AlertType.info:
        color['main'] = Colors.blue;
        color['sub'] = Colors.cyan;
        color['shadow'] = Colors.blue[800];
        break;
      case AlertType.error:
        color['main'] = Colors.red;
        color['sub'] = Colors.pinkAccent;
        color['shadow'] = Colors.red[800];
        break;
      case AlertType.success:
        color['main'] = Colors.green;
        color['sub'] = Colors.greenAccent;
        color['shadow'] = Colors.green[800];
        break;
    }

    return Flushbar(
      message: this._message,
      backgroundGradient:
      LinearGradient(colors: [color['main'], color['sub']]),
      backgroundColor: color['main'],
      boxShadows: [
        BoxShadow(
          color: color['shadow'],
          offset: Offset(0.0, 2.0),
          blurRadius: 3.0,
        )
      ],
      margin: EdgeInsets.all(8),
      borderRadius: 8,
      duration: Duration(seconds: 2),
    );
  }

  void show() {
    this._flushbar.show(this._context);
  }

  void hide() {
    this._flushbar.dismiss();
  }
}
