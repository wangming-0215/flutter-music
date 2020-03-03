import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music/utils/http_client.dart';
import 'package:music/widgets/logo.dart';
import 'package:music/App.dart';
import 'package:music/models/user.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    // 初始化 HttpClient
    HttpClient.init();
    App.initSharedPreferences();

    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = Tween<double>(begin: 0, end: 150).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 1), () {
            goTo();
          });
        }
      });
    controller.forward();
  }

  void goTo() {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    userModel.initUser();
    if (userModel.user != null) {
      HttpClient.refreshLogin().then((_) {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _GrowTransition(
          child: Hero(
            child: LogoWidget(),
            tag: 'logo',
          ),
          animation: animation,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const _GrowTransition({Key key, this.child, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) => Container(
        child: child,
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
