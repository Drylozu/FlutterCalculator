import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../../theme.dart' as Local;

class CreditsSetting extends StatelessWidget {
  final Local.Theme theme;
  final PackageInfo packageInfo;

  CreditsSetting(this.packageInfo, this.theme);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
      color: Color(theme.settings.title.color)
          .withOpacity(theme.settings.title.opacity),
    ); //COLOR: settings tile title
    TextStyle subtitleStyle = TextStyle(
      color: Color(theme.settings.subtitle.color)
          .withOpacity(theme.settings.subtitle.opacity),
    ); //COLOR: settings tile subtitle

    return Column(
      children: [
        ListTile(
          title: Text(
            'Made by Drylotrans',
            style: titleStyle,
          ),
          subtitle: Text(
            packageInfo == null ? '...' : '${packageInfo.appName} - v${packageInfo.version}',
            style: subtitleStyle,
          ),
        ),
        Divider(
          color: Color(theme.gridBorders.color)
              .withOpacity(theme.gridBorders.opacity), //COLOR: grid borders
        ),
      ],
    );
  }
}
