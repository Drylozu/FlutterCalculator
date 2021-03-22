import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../themes/theme_provider.dart';

class BackgroundImage extends StatelessWidget {
  BackgroundImage();

  @override
  Widget build(BuildContext context) {
    final themes = Provider.of<ThemeProvider>(context);
    final theme = themes.selectedTheme;

    return theme.background.imageUrl != null
        ? Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(theme.background.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: theme.background.imageBlur,
                sigmaY: theme.background.imageBlur,
              ),
              child: Container(
                color: Color(theme.background.color).withOpacity(
                    theme.background.opacity), //COLOR: main background
              ),
            ),
          )
        : Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(theme.background.color)
                .withOpacity(theme.background.opacity), //COLOR: main background
          );
  }
}
