import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../themes/theme_provider.dart';

class CalculatorText extends StatelessWidget {
  final String text;
  final String subtext;
  final double height;

  CalculatorText(this.text, this.subtext, this.height);

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

    List<Widget> texts = [
      FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          '${this.text}',
          style: TextStyle(
            fontSize: 65.0,
            color: Color(theme.resultText.color).withOpacity(
                theme.resultText.opacity), //COLOR: result text
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
