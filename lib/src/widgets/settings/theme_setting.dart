import 'package:flutter/material.dart';

import '../../theme.dart' as Local;
import '../../themes.dart';

class ThemeSetting extends StatelessWidget {
  final List<Local.Theme> themes;
  final Local.Theme theme;
  final Function reload;

  ThemeSetting(this.themes, this.theme, this.reload);

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
            'Selected Theme',
            style: titleStyle,
          ),
          subtitle: Text(
            'Theme by ${theme.author}',
            style: subtitleStyle,
          ),
          trailing: DropdownButton(
            value: theme.id,
            items: themes
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
                .withOpacity(0.8), //COLOR: main background
            onChanged: (id) {
              if (theme.id == id) return;
              changeTheme(id);
              reload();
              Navigator.pop(context);
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
