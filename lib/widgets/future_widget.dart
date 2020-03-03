import 'package:flutter/material.dart';

class CustomFutureWidget<T> extends StatefulWidget {
  final Future future;
  final Widget loadingWidget;
  final ValueWidgetBuilder<T> itemBuilder;

  CustomFutureWidget({
    @required this.future,
    @required this.itemBuilder,
    this.loadingWidget,
  });

  @override
  _CustomFutureWidgetState createState() => _CustomFutureWidgetState();
}

class _CustomFutureWidgetState extends State<CustomFutureWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
            return widget.loadingWidget ?? Container();
          case ConnectionState.done:
            if (snapshot.hasData) {
              return widget.itemBuilder(context, snapshot.data, null);
            } else if (snapshot.hasError) {
              Scaffold.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                  children: <Widget>[
                    Icon(Icons.error),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('Error: ${snapshot.error}')
                  ],
                ),
                behavior: SnackBarBehavior.floating,
              ));
              return Container();
            }
            return Container();
          default:
            return Container();
        }
      },
    );
  }
}
