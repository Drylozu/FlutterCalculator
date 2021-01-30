import 'package:flutter/material.dart';

import '../theme.dart' as Local;

class CalculatorText extends StatelessWidget {
  final String text;
  final String subtext;
  final double height;
  final Local.Theme theme;

  CalculatorText(this.text, this.subtext, this.height, this.theme);

  @override
  Widget build(BuildContext context) {
    List<Widget> texts = [
      FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          '${this.text}',
          style: TextStyle(
            fontSize: 65.0,
            color: Color(theme.numericPad.text.color).withOpacity(
                theme.numericPad.text.opacity), //COLOR: result text
          ),
        ),
      ),
    ];

    if (subtext != '')
      texts.add(
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Opacity(
            opacity: 0.4,
            child: Text(
              '= ${this.subtext}',
              style: TextStyle(
                fontSize: 30.0,
                color: Color(theme.preResultText.color).withOpacity(
                    theme.preResultText.opacity), //COLOR: temporal result text
              ),
            ),
          ),
        ),
      );

    return Container(
      width: double.infinity,
      height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: texts,
        ),
      ),
      alignment: Alignment.bottomRight,
    );
  }
}
