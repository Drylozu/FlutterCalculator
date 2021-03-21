import 'dart:ui';

import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/background_image.dart';
import '../widgets/settings_button.dart';
import '../themes/theme_provider.dart';
import '../widgets/results.dart';
import '../widgets/buttons.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String text = '0';
  String temporalResult = '';

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

    final screenSize = MediaQuery.of(context).size;

    FlutterStatusbarcolor.setStatusBarColor(
        Color(theme.notificationBar.background.color).withOpacity(theme
            .notificationBar.background.opacity)); //COLOR: notifications bar
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        theme.notificationBar.iconsColor == 'white');
    FlutterStatusbarcolor.setNavigationBarColor(
        Color(theme.navigationBar.background.color).withOpacity(
            theme.navigationBar.background.opacity)); //COLOR: navigation bar
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(
        theme.navigationBar.iconsColor == 'white');

    return Scaffold(
      backgroundColor: Color(theme.background.color)
          .withOpacity(theme.background.opacity), //COLOR: main background
      body: Stack(
        children: <Widget>[
          BackgroundImage(),
          Column(
            children: <Widget>[
              Container(
                height: (screenSize.height / 10),
                child: SettingsButton(
                  (((screenSize.height / 10) / 10) * 4),
                  (((screenSize.height / 10) / 10) * 3),
                ),
              ),
              CalculatorText(
                this.text,
                this.temporalResult,
                ((screenSize.height / 10) * 2.8),
              ),
              Divider(
                endIndent: 10.0,
                indent: 10.0,
              ),
              CalculatorButtons(
                this.handleTapButton,
                ((screenSize.height / 10) * 6) / 5.09,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Function handleTapButton(String buttonText) {
    return () {
      setState(() {
        if (this.text == 'NaN') this.text = '0';
        if (this.temporalResult == 'NaN') this.text = '0';

        if (buttonText == '=' && RegExp('[0-9]\$').hasMatch(this.text)) {
          double result = Parser()
              .parse(this.text)
              .evaluate(EvaluationType.REAL, ContextModel());
          this.text = result.toString().replaceAll(RegExp('.0\$'), '');
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

        if (this.text != '0' &&
            RegExp('[0-9]\$').hasMatch(this.text) &&
            buttonText != '=') {
          double result = Parser()
              .parse(this.text)
              .evaluate(EvaluationType.REAL, ContextModel());
          this.temporalResult = result.toString();
        } else if (buttonText != '=') this.temporalResult = '';

        this.temporalResult =
            this.temporalResult.replaceAll(RegExp('.0\$'), '');

        if (this.text == 'NaN') this.text = '0';
        if (this.temporalResult == 'NaN') this.temporalResult = '0';
      });
    };
  }
}
