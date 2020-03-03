import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:music/utils/http_client.dart';
import 'package:music/entities/user.dart';
import 'package:music/common/constants.dart';
import 'package:music/App.dart';

class UserModel extends ChangeNotifier {
  UserEntity _user;

  get user => _user;

  void initUser() {
    if (App.preferences.containsKey(Constants.sharedUserKey)) {
      String user = App.preferences.getString(Constants.sharedUserKey);
      _user = UserEntity.fromJson(json.decode(user));
    }
  }

  Future<UserEntity> login(String email, String password) async {
    UserEntity user = await HttpClient.login(email, password);
    _saveUserInfo(user);
    notifyListeners();
    return user;
  }

  void logout() {
    if (App.preferences.containsKey(Constants.sharedUserKey)) {
      App.preferences.remove(Constants.sharedUserKey);
      _user = null;
      notifyListeners();
    }
  }

  void _saveUserInfo(UserEntity user) {
    _user = user;
    App.preferences.setString(Constants.sharedUserKey, json.encode(user));
  }
}
