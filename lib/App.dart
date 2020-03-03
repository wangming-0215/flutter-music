import 'package:shared_preferences/shared_preferences.dart';

class App {
  static SharedPreferences preferences;

  static initSharedPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }
}
