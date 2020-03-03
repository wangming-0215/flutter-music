import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:music/common/constants.dart';
import 'package:music/screens/splash.dart';
import 'package:music/routes/routes.dart';
import 'package:music/models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserModel(),
      )
    ],
    child: MaterialApp(
      title: 'Music',
      home: Splash(),
      debugShowCheckedModeBanner: false,
      navigatorKey: Constants.navigationKey,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        splashColor: Colors.transparent,
      ),
      onGenerateRoute: (settings) => Routes.configureRoutes(settings),
    ),
  ));
}
