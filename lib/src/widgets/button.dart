import 'package:flutter/material.dart';

import '../theme.dart' as Local;

class CalculatorButton extends StatelessWidget {
  final String text;
  final double height;
  final Local.Theme theme;
  final Function onTap;
  final bool circle;

  CalculatorButton(this.text, this.height, this.theme,
      {this.onTap, this.circle = false});

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: TextStyle(
        fontSize: 30.0,
        color: Color(theme.numericPad.text.color).withOpacity(
            theme.numericPad.text.opacity), //COLOR: normal buttons text
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap(text),
      child: Container(
        height: height,
        child: circle
            ? Container(
                width: (height / 10) * 6,
                height: (height / 10) * 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(theme.numericPad.resultButton.color).withOpacity(
                      theme.numericPad.resultButton
                          .opacity), //COLOR: circle button
                ),
                child: textWidget,
                alignment: Alignment.center,
              )
            : textWidget,
        alignment: Alignment.center,
      ),
    );
  }
}
