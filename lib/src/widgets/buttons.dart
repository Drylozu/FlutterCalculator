import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../themes/theme_provider.dart';
import './exit_button.dart';
import './button.dart';

class CalculatorButtons extends StatelessWidget {
  final Function handleTap;
  final double buttonsHeight;

  CalculatorButtons(this.handleTap, this.buttonsHeight);

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide(
          color: Color(theme.gridBorders.color)
              .withOpacity(theme.gridBorders.opacity), //COLOR: grid border
        ),
      ),
      children: [
        TableRow(children: <Widget>[
          CalculatorButton('CE', buttonsHeight, onTap: handleTap),
          CalculatorButton('C', buttonsHeight, onTap: handleTap),
          CalculatorExit(buttonsHeight),
          CalculatorButton('/', buttonsHeight, onTap: handleTap),
        ]),
        TableRow(children: <Widget>[
          CalculatorButton('1', buttonsHeight, onTap: handleTap),
          CalculatorButton('2', buttonsHeight, onTap: handleTap),
          CalculatorButton('3', buttonsHeight, onTap: handleTap),
          CalculatorButton('*', buttonsHeight, onTap: handleTap),
        ]),
        TableRow(children: <Widget>[
          CalculatorButton('4', buttonsHeight, onTap: handleTap),
          CalculatorButton('5', buttonsHeight, onTap: handleTap),
          CalculatorButton('6', buttonsHeight, onTap: handleTap),
          CalculatorButton('-', buttonsHeight, onTap: handleTap),
        ]),
        TableRow(children: <Widget>[
          CalculatorButton('7', buttonsHeight, onTap: handleTap),
          CalculatorButton('8', buttonsHeight, onTap: handleTap),
          CalculatorButton('9', buttonsHeight, onTap: handleTap),
          CalculatorButton('+', buttonsHeight, onTap: handleTap),
        ]),
        TableRow(
          children: <Widget>[
            CalculatorButton('.', buttonsHeight, onTap: handleTap),
            CalculatorButton('0', buttonsHeight, onTap: handleTap),
            CalculatorButton('00', buttonsHeight, onTap: handleTap),
            CalculatorButton(
              '=',
              buttonsHeight,
              onTap: handleTap,
              circle: true,
            ),
          ],
        ),
      ],
    );
  }
}
