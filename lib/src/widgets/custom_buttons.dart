import 'package:flutter/material.dart';

import './custom_exit.dart';
import './custom_button.dart';

class CalculatorButtons extends StatelessWidget {
  final Function handleTap;
  final double buttonsHeight;

  CalculatorButtons(this.handleTap, this.buttonsHeight);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.symmetric(
        inside: BorderSide(
          color: Colors.black12,
        ),
      ),
      children: [
        TableRow(children: [
          CalculatorButton("CE", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("C", this.buttonsHeight, onTap: handleTap),
          CalculatorExit(this.buttonsHeight),
          CalculatorButton("/", this.buttonsHeight, onTap: handleTap),
        ]),
        TableRow(children: [
          CalculatorButton("1", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("2", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("3", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("*", this.buttonsHeight, onTap: handleTap),
        ]),
        TableRow(children: [
          CalculatorButton("4", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("5", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("6", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("-", this.buttonsHeight, onTap: handleTap),
        ]),
        TableRow(children: [
          CalculatorButton("7", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("8", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("9", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("+", this.buttonsHeight, onTap: handleTap),
        ]),
        TableRow(children: [
          CalculatorButton(".", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("0", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("00", this.buttonsHeight, onTap: handleTap),
          CalculatorButton("=", this.buttonsHeight, 
            onTap: handleTap,
            circle: true
          ),
        ]),
      ],
    );
  }
}