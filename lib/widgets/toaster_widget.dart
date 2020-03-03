import 'package:flutter/material.dart';

class ToasterWidget {
  static Widget _buildSnackBar({
    Color backgroundColor,
    Icon icon,
    Widget message,
  }) {
    return SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: <Widget>[
          icon,
          Container(
            margin: EdgeInsets.only(left: 8.0),
            child: message,
          )
        ],
      ),
    );
  }

  static void success(context, {Widget message}) {
    Scaffold.of(context).showSnackBar(
      _buildSnackBar(
        backgroundColor: Colors.green,
        icon: Icon(Icons.check_circle),
        message: message,
      ),
    );
  }

  static void error(context, {Widget message}) {
    Scaffold.of(context).showSnackBar(
      _buildSnackBar(
        backgroundColor: Colors.red,
        icon: Icon(Icons.error),
        message: message,
      ),
    );
  }

  static void warning(context, {Widget message}) {
    Scaffold.of(context).showSnackBar(
      _buildSnackBar(
        backgroundColor: Colors.orange,
        icon: Icon(Icons.warning),
        message: message,
      ),
    );
  }

  static void info(context, {Widget message}) {
    Scaffold.of(context).showSnackBar(
      _buildSnackBar(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.info),
        message: message,
      ),
    );
  }
}
