import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../theme.dart' as Local;
import '../../themes.dart';

class ThemePickerSetting extends StatelessWidget {
  final Local.Theme theme;
  final Function reload;

  ThemePickerSetting(this.theme, this.reload);

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
      children: <Widget>[
        ListTile(
            title: Text(
              'Load a new theme',
              style: titleStyle,
            ),
            subtitle: Text(
              'Open the file picker and select a YAML (.yaml, .yml) file',
              style: subtitleStyle,
            ),
            onTap: () async {
              FilePickerResult result =
                  await FilePicker.platform.pickFiles(allowMultiple: false);
              if (result != null) {
                String filePath = result.files.first.path;
                String error = await registerTheme(filePath);
                if (error != '')
                  Toast.show(
                    'Couldn\'t load theme ($error).',
                    context,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM,
                  );
                else reload();
              }
            }),
        Divider(
          color: Color(theme.gridBorders.color)
              .withOpacity(theme.gridBorders.opacity), //COLOR: grid border
        ),
      ],
    );
  }
}
