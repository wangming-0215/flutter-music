import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterLogo(),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }
}
