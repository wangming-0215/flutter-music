import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music/widgets/logo.dart';
import 'package:music/widgets/loading_dialog.dart';
import 'package:music/widgets/toaster_widget.dart';
import 'package:music/models/user.dart';

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);

  Widget _buildLogoWidget() {
    return Center(
      child: Container(
        width: 80,
        height: 80,
        child: Hero(
          child: LogoWidget(),
          tag: 'logo',
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return _LoginForm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false, // 软键盘弹出时是否顶起布局
      body: SafeArea(
        bottom: false,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _buildLogoWidget(),
            ),
            Expanded(
              flex: 2,
              child: _buildLoginForm(),
            )
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  _LoginForm({Key key}) : super(key: key);

  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(debugLabel: "form_key");

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _onLogin() {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    String email = _emailController.text;
    String password = _passwordController.text;
    Loading.showLoading(context);
    userModel.login(email, password).then((_) {
      ToasterWidget.success(context, message: Text('登录成功'));
      Loading.hideLoading(context);
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        (route) => route != null,
      );
    }).catchError((e) {
      print(e);
      ToasterWidget.error(context, message: Text('登录失败，请重新登录'));
      Loading.hideLoading(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 获取设备屏幕尺寸
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _emailController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: '邮箱',
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            Container(
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: '密码',
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              height: 48,
              width: size.width * 0.8,
              child: RaisedButton(
                onPressed: _onLogin,
                child: Text(
                  '登录',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
