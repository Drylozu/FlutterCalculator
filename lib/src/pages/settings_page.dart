import 'dart:ui';

import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/settings/delete_theme_setting.dart';
import '../widgets/settings/theme_picker_setting.dart';
import '../widgets/settings/credits_setting.dart';
import '../widgets/settings/theme_setting.dart';
import '../themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

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
      appBar: AppBar(
        leading: BackButton(
          color: Color(theme.settings.bar.text.color).withOpacity(
              theme.settings.bar.text.opacity), //COLOR: settings title-icon
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(theme.settings.bar.text.color).withOpacity(
                theme.settings.bar.text.opacity), //COLOR: settings title
          ),
        ),
        backgroundColor: Color(theme.settings.bar.background.color).withOpacity(
            theme.settings.bar.background.opacity), //COLOR: settings background
      ),
      backgroundColor: Color(theme.background.color)
          .withOpacity(theme.background.opacity), //COLOR: main background
      body: ListView(
        children: <Widget>[
          ThemeSetting(),
          ThemePickerSetting(),
          DeleteThemeSetting(),
          CreditsSetting(),
        ],
      ),
    );
  }
}
