import 'package:flutter/material.dart';

import '../theme.dart' as Local;
import './exit_button.dart';
import './button.dart';

class CalculatorButtons extends StatelessWidget {
  final Function handleTap;
  final double buttonsHeight;
  final Local.Theme theme;

  CalculatorButtons(this.handleTap, this.buttonsHeight, this.theme);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide(
          color: Color(theme.gridBorders.color)
              .withOpacity(theme.gridBorders.opacity), //COLOR: grid border
        ),
      ),
      children: [
        TableRow(children: <Widget>[
          CalculatorButton('CE', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('C', buttonsHeight, theme, onTap: handleTap),
          CalculatorExit(buttonsHeight, theme),
          CalculatorButton('/', buttonsHeight, theme, onTap: handleTap),
        ]),
        TableRow(children: <Widget>[
          CalculatorButton('1', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('2', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('3', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('*', buttonsHeight, theme, onTap: handleTap),
        ]),
        TableRow(children: <Widget>[
          CalculatorButton('4', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('5', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('6', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('-', buttonsHeight, theme, onTap: handleTap),
        ]),
        TableRow(children: <Widget>[
          CalculatorButton('7', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('8', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('9', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('+', buttonsHeight, theme, onTap: handleTap),
        ]),
        TableRow(children: <Widget>[
          CalculatorButton('.', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('0', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton('00', buttonsHeight, theme, onTap: handleTap),
          CalculatorButton(
            '=',
            buttonsHeight,
            theme,
            onTap: handleTap,
            circle: true,
          ),
        ]),
      ],
    );
  }
}
