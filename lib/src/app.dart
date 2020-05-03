import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:provider/provider.dart';

import './pages/home_page.dart';
import './theme_changer.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialThemeApp(),
    );
  }
}

class MaterialThemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final themes = Provider.of<ThemeChanger>(context);
    FlutterStatusbarcolor.setStatusBarColor(
        themes.currentTheme.brightness == Brightness.dark
            ? Colors.black38
            : Colors.white);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(
        themes.currentTheme.brightness == Brightness.dark);

    FlutterStatusbarcolor.setNavigationBarColor(
        themes.currentTheme.brightness == Brightness.dark
            ? Colors.black87
            : Colors.white);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(
        themes.currentTheme.brightness == Brightness.dark);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themes.currentTheme,
      home: HomePage()
    );
  }
}