import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../themes/theme_provider.dart';
import '../pages/settings_page.dart';

class SettingsButton extends StatelessWidget {
  final double size;
  final double padding;

  SettingsButton(this.size, this.padding);

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

    return Container(
      width: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.bottomToTop,
            child: SettingsPage(),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, top: padding),
          child: Icon(
            Icons.settings,
            color: Color(theme.settingsButton.color).withOpacity(
                theme.settingsButton.opacity), //COLOR: settings button
          ),
        ),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
