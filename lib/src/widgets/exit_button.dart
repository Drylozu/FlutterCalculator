import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import '../themes/theme_provider.dart';

class CalculatorExit extends StatelessWidget {
  final double height;

  CalculatorExit(this.height);

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Toast.show(
        'Press again to exit.',
        context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM,
      ),
      onDoubleTap: () => SystemNavigator.pop(),
      child: Container(
        height: height,
        child: Icon(
          Icons.exit_to_app,
          color: Color(theme.numericPad.exitButton.color).withOpacity(
              theme.numericPad.exitButton.opacity), //COLOR: exit button
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
