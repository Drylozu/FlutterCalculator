import 'package:shared_preferences/shared_preferences.dart';
import 'package:json2yaml/json2yaml.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

import './default_themes.dart';
import './theme.dart' as Local;

class ThemeProvider extends ChangeNotifier {
  SharedPreferences prefs;
  Local.Theme selectedTheme;
  List<Local.Theme> loadedThemes;

  ThemeProvider() {
    selectedTheme =
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    loadedThemes = [darkTheme, lightTheme];
    _loadFromPrefs();
  }

  setTheme(String id) async {
    await _initPrefs();
    selectedTheme = loadedThemes.firstWhere((t) => t.id == id) ?? darkTheme;
    await _saveThemes();
    notifyListeners();
  }

  registerTheme(String rawTheme) async {
    await _initPrefs();
    Local.Theme theme = Local.Theme.fromJson(loadYaml(rawTheme));
    if (loadedThemes.any((t) => t.id == theme.id))
      loadedThemes[loadedThemes.indexWhere((t) => t.id == theme.id)] = theme;
    else
      loadedThemes.add(theme);
    selectedTheme = theme;
    await _saveThemes();
    notifyListeners();
  }

  removeTheme(String id) async {
    await _initPrefs();
    Local.Theme theme = loadedThemes.firstWhere((t) => t.id == id);
    if (theme.id.startsWith('defaults:')) return;
    if (selectedTheme.id == theme.id)
      selectedTheme =
          SchedulerBinding.instance.window.platformBrightness == Brightness.dark
              ? darkTheme
              : lightTheme;
    loadedThemes.removeWhere((t) => t.id == theme.id);
    await _saveThemes();
    notifyListeners();
  }

  _initPrefs() async {
    if (prefs == null) prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('themes')) await prefs.setStringList('themes', []);
    if (!prefs.containsKey('theme'))
      await prefs.setString('theme', selectedTheme.id);
  }

  _loadFromPrefs() async {
    await _initPrefs();
    List<String> rawThemes = prefs.getStringList('themes');
    loadedThemes
      ..addAll(rawThemes.map((t) => Local.Theme.fromJson(loadYaml(t))));
    String selectedThemeId = prefs.getString('theme');
    selectedTheme = loadedThemes.firstWhere((t) => t.id == selectedThemeId);
    notifyListeners();
  }

  _saveThemes() async {
    await _initPrefs();
    prefs.setStringList(
      'themes',
      loadedThemes
          .where((t) => !t.id.startsWith('defaults:'))
          .map((t) => json2yaml(t.toJson()))
          .toList(),
    );
    prefs.setString(
      'theme',
      selectedTheme.id,
    );
  }
}
