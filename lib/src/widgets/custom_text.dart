import 'package:flutter/material.dart';

class CalculatorText extends StatelessWidget {
  final String text;
  final String subtext;
  final double height;

  CalculatorText(this.text, this.subtext, this.height);

  @override
  Widget build(BuildContext context) {
    List<Widget> texts = [
      FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          "${this.text}",
          style: TextStyle(fontSize: 65.0),
        ),
      ),
    ];

    if (this.subtext != "")
      texts.add(FittedBox(
          fit: BoxFit.fitWidth,
          child: Opacity(
            opacity: 0.4,
            child: Text(
              "= ${this.subtext}",
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
      );

    return Container(
      width: double.infinity,
      height: this.height,
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