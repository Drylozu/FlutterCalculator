import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_changer.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final double height;
  final Function onTap;
  final bool circle;

  CalculatorButton(this.text, this.height, {this.onTap, this.circle = false});

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeChanger>(context);
    final textWidget = Text(
      this.text,
      style: TextStyle(
        fontSize: 30.0,
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: this.onTap(this.text),
      child: Container(
        height: this.height,
        child: this.circle
          ? Container(
              width: (this.height / 10) * 6,
              height: (this.height / 10) * 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: themes.currentTheme.cardColor,
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