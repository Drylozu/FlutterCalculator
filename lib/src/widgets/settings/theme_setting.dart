import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../themes/theme_provider.dart';

class ThemeSetting extends StatelessWidget {
  ThemeSetting();

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

    return Column(
      children: [
        ListTile(
          title: Text(
            'Selected Theme',
            style: titleStyle,
          ),
          subtitle: Text(
            'Theme by ${theme.author}',
            style: subtitleStyle,
          ),
          trailing: DropdownButton(
            value: theme.id,
            items: themes.loadedThemes
                .map(
                  (t) => DropdownMenuItem(
                    value: t.id,
                    child: Text(
                      t.displayName +
                          (t.id.startsWith('defaults:')
                              ? ' (pre-installed)'
                              : ''),
                      style: titleStyle,
                    ),
                  ),
                )
                .toList(),
            dropdownColor: Color(theme.background.color)
                .withOpacity(1), //COLOR: main background
            onChanged: (id) async {
              if (theme.id == id) return;
              await themes.setTheme(id);
            },
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
