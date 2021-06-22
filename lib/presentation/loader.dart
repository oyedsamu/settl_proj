import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final Widget widget;
  final Color color;

  Loader({required this.widget, this.color = Colors.deepPurple});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget,
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ),
      ],
    );
  }
}
