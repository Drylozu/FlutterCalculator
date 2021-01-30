import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme.dart' as Local;

class BackgroundImage extends StatelessWidget {
  final Local.Theme theme;

  BackgroundImage(this.theme);

  @override
  Widget build(BuildContext context) {
    return theme.background.imageUrl != null
        ? Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(theme.background.imageUrl),
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
