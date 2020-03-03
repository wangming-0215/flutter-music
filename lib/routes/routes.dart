import 'package:flutter/material.dart';
import 'package:music/screens/login.dart';
import 'package:music/screens/home/home.dart';

class Routes {
  static Map<String, Function> routes = {
    '/login': (context) => Login(),
    '/home': (context) => Home(),
  };

  static Route configureRoutes(RouteSettings settings) {
    Function builder = routes[settings.name];
    if (settings.arguments != null) {
      return MaterialPageRoute(
        builder: (context) => builder(context, arguments: settings.arguments),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => builder(context),
      );
    }
  }
}
