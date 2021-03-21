import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../themes/theme_provider.dart';

class DeleteThemeSetting extends StatelessWidget {
  DeleteThemeSetting();

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
            'Remove theme',
            style: titleStyle,
          ),
          subtitle: Text(
            'Removes the current theme',
            style: subtitleStyle,
          ),
          onTap: () {
            if (theme.id.startsWith('defaults'))
              return Toast.show(
                'You can\'t remove default themes',
                context,
                duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM,
              );
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor:
                      Color(theme.settings.bar.background.color).withOpacity(1),
                  title: Text(
                    'Are you sure?',
                    style: TextStyle(
                      color:
                          Color(theme.settings.bar.text.color).withOpacity(1),
                    ),
                  ),
                  content: Text(
                    'Theme ${theme.displayName} (by ${theme.author}) will be removed if accept.',
                    style: TextStyle(
                      color:
                          Color(theme.settings.bar.text.color).withOpacity(0.8),
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    TextButton(
                      child: Text('Accept'),
                      onPressed: () async {
                        try {
                          await themes.removeTheme(theme.id);
                          Toast.show(
                            'Successfully removed theme ${theme.id}.',
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM,
                          );
                        } catch (e) {
                          Toast.show(
                            'Couldn\'t remove the theme.',
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM,
                          );
                        }
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        Divider(
          color: Color(theme.gridBorders.color)
              .withOpacity(theme.gridBorders.opacity), //COLOR: grid borders
        ),
      ],
    );
  }
}
