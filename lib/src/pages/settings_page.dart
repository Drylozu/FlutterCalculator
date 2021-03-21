import 'dart:ui';

import 'package:package_info/package_info.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import '../widgets/settings/delete_theme_setting.dart';
import '../widgets/settings/theme_picker_setting.dart';
import '../widgets/settings/credits_setting.dart';
import '../widgets/settings/theme_setting.dart';
import '../widgets/background_image.dart';
import '../theme.dart' as Local;
import '../themes.dart';

class SettingsPage extends StatefulWidget {
  final Function reloadMain;

  SettingsPage(this.reloadMain);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentTheme(),
      initialData: Local.Theme.fromJson(YamlMap()),
      builder: (BuildContext context, AsyncSnapshot<Local.Theme> snapshot) {
        Local.Theme theme = snapshot.data;
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
            backgroundColor: Color(theme.settings.bar.background.color)
                .withOpacity(theme.settings.bar.background
                    .opacity), //COLOR: settings background
          ),
          backgroundColor: Color(theme.background.color)
              .withOpacity(theme.background.opacity), //COLOR: main background
          body: Stack(
            children: <Widget>[
              BackgroundImage(theme),
              ListView(
                children: <Widget>[
                  FutureBuilder(
                    future: getThemes(),
                    initialData: <Local.Theme>[theme],
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Local.Theme>> snapshot) {
                      List<Local.Theme> themes = snapshot.data;
                      return ThemeSetting(themes, theme, widget.reloadMain);
                    },
                  ),
                  ThemePickerSetting(theme, () => setState(() {})),
                  DeleteThemeSetting(
                      theme, () => setState(() {}), widget.reloadMain),
                  FutureBuilder(
                    future: PackageInfo.fromPlatform(),
                    builder: (BuildContext context,
                        AsyncSnapshot<PackageInfo> snapshot) {
                      return CreditsSetting(snapshot.data, theme);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
