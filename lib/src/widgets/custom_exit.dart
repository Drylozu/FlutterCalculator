import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class CalculatorExit extends StatelessWidget {
  final double height;

  CalculatorExit(this.height);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Toast.show("Press again to exit.", context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.TOP
      ),
      onDoubleTap: () => SystemNavigator.pop(),
      child: Container(
        height: this.height,
        child: Icon(Icons.exit_to_app),
        alignment: Alignment.center,
      ),
    );
  }
}