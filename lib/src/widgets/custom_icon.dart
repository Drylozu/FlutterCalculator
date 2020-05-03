import 'package:flutter/material.dart';

import '../theme_changer.dart';

class ThemeIcon extends StatelessWidget {
  final ThemeChanger themes;
  final double size;
  final double padding;

  ThemeIcon(this.themes, this.size, this.padding);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (this.themes.currentTheme.brightness == Brightness.dark) 
            this.themes.setTheme(ThemeData.light());
          else
            this.themes.setTheme(ThemeData.dark());
        },
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, top: this.padding),
          child: this.themes.currentTheme.brightness == Brightness.light
              ? Icon(Icons.brightness_7)
              : Transform.rotate(
                  angle: 0.6,
                  child: Icon(Icons.brightness_3, size: this.size),
                ),
        ),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}