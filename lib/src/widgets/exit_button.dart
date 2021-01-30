import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../theme.dart' as Local;

class CalculatorExit extends StatelessWidget {
  final double height;
  final Local.Theme theme;

  CalculatorExit(this.height, this.theme);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Toast.show(
        "Press again to exit.",
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
      ),
      onDoubleTap: () => SystemNavigator.pop(),
      child: Container(
        height: height,
        child: Icon(
          Icons.exit_to_app,
          color: Color(theme.numericPad.exitButton.color).withOpacity(
              theme.numericPad.exitButton.opacity), //COLOR: exit button
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
