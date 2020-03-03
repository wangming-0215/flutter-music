import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music/models/user.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return RaisedButton(
              child: Text('退出', style: TextStyle(color: Colors.white)),
              color: Colors.red,
              onPressed: () {
                userModel.logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => route != null,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
