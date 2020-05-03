import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_buttons.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_icon.dart';
import '../theme_changer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '0';
  String temporalResult = '';

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeChanger>(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: (screenSize.height / 10),
            child: ThemeIcon(themes, (((screenSize.height / 10) / 10) * 4), (((screenSize.height / 10) / 10) * 3)),
          ),
          CalculatorText(this.text, this.temporalResult, ((screenSize.height / 10) * 2.8)),
          Divider(
            endIndent: 10.0,
            indent: 10.0,
          ),
          CalculatorButtons(this.handleTapButton, ((screenSize.height / 10) * 6) / 5.09),
        ],
      ),
    );
  }

  Function handleTapButton(String buttonText) {
    return () {
      setState(() {
        if (buttonText == '=' && RegExp('[0-9]\$').hasMatch(this.text)) {
          double result = Parser().parse(this.text).evaluate(EvaluationType.REAL, ContextModel());
          this.text = result.toString();
          this.temporalResult = '';
        } else if (RegExp('[0-9]+').hasMatch(buttonText)) {
          if (this.text == '0') {
            if (!['00', '0'].contains(buttonText)) this.text = buttonText;
          } else
            this.text += buttonText;
        } else {
          if (buttonText == 'C') {
            if (this.text.length == 1 || this.text == '0')
              this.text = '0';
            else
              this.text = text.substring(0, this.text.length - 1);
          } else if (buttonText == 'CE')
            this.text = '0';
          else if (RegExp('[0-9]\$').hasMatch(this.text))
            this.text += buttonText;
        }

        if (this.text != '0' && RegExp('[0-9]\$').hasMatch(this.text) && buttonText != '=') {
          double result = Parser().parse(this.text).evaluate(EvaluationType.REAL, ContextModel());
          this.temporalResult = result.toString();
        } else if (buttonText != '=') this.temporalResult = '';

        this.temporalResult = this.temporalResult.replaceAll(RegExp('.0\$'), '');
      });
    };
  }
}
