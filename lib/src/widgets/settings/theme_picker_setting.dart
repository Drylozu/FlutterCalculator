import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import '../../themes/theme_provider.dart';

class ThemePickerSetting extends StatelessWidget {
  ThemePickerSetting();

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
                PlatformFile file = result.files.first;
                if (!['yaml', 'yml'].contains(file.extension))
                  return Toast.show(
                    'Unsupported file extension for themes.',
                    context,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM,
                  );
                try {
                  await themes
                      .registerTheme(await File(file.path).readAsString());
                } catch (e) {
                  Toast.show(
                    'Couldn\'t load theme.',
                    context,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM,
                  );
                }
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
