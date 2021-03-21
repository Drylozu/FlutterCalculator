import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../themes/theme_provider.dart';

class CreditsSetting extends StatelessWidget {
  CreditsSetting();

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

    TextStyle titleStyle = TextStyle(
      color: Color(theme.settings.title.color)
          .withOpacity(theme.settings.title.opacity),
    ); //COLOR: settings tile title
    TextStyle subtitleStyle = TextStyle(
      color: Color(theme.settings.subtitle.color)
          .withOpacity(theme.settings.subtitle.opacity),
    ); //COLOR: settings tile subtitle

    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) => Column(
        children: [
          ListTile(
            title: Text(
              'Made by Drylozu',
              style: titleStyle,
            ),
            subtitle: Text(
              snapshot.hasData
                  ? '${snapshot.data.appName} - v${snapshot.data.version}'
                  : 'Retrieving info...',
              style: subtitleStyle,
            ),
          ),
          Divider(
            color: Color(theme.gridBorders.color)
                .withOpacity(theme.gridBorders.opacity), //COLOR: grid borders
          ),
        ],
      ),
    );
  }
}
