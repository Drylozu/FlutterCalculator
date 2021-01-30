import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../pages/settings_page.dart';
import '../theme.dart' as Local;

class SettingsButton extends StatelessWidget {
  final double size;
  final double padding;
  final Local.Theme theme;
  final Function reload;

  SettingsButton(this.size, this.padding, this.theme, this.reload);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: SettingsPage(reload),
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
