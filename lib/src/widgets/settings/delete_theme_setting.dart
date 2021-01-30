import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../theme.dart' as Local;
import '../../themes.dart';

class DeleteThemeSetting extends StatelessWidget {
  final Local.Theme theme;
  final Function reload;
  final Function reloadMain;

  DeleteThemeSetting(this.theme, this.reload, this.reloadMain);

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
            'Remove theme',
            style: titleStyle,
          ),
          subtitle: Text(
            'Removes the current theme',
            style: subtitleStyle,
          ),
          onTap: () {
            if (theme.id.startsWith('defaults')) {
              Toast.show(
                'You can\'t remove default themes',
                context,
                duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM,
              );
              return;
            }
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
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    FlatButton(
                      child: Text('Accept'),
                      onPressed: () async {
                        String error = await removeTheme(theme.id);
                        if (error != '')
                          Toast.show(
                            'Couldn\'t remove the theme ($error)',
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM,
                          );
                        reloadMain();
                        reload();
                        Navigator.of(context).pop();
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
