import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yaml/yaml.dart';

import './theme.dart' as Local;

Future<SharedPreferences> getPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String defaultTheme =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark
          ? 'dark'
          : 'light';
  if (!prefs.containsKey('customThemes'))
    await prefs.setStringList('customThemes', []);
  if (!prefs.containsKey('selectedTheme'))
    await prefs.setString('selectedTheme', 'defaults:$defaultTheme');
  prefs.setStringList(
      'customThemes',
      prefs
          .getStringList('customThemes')
          .where((path) => File(path).existsSync())
          .toList());
  return prefs;
}

Future<List<Local.Theme>> getThemes() async {
  SharedPreferences prefs = await getPreferences();
  List<String> customThemes = prefs.getStringList('customThemes');
  List<String> defaultThemes = [
    'assets/themes/dark.yaml',
    'assets/themes/light.yaml'
  ];
  List<String> loadedThemes = await Future.wait(
      defaultThemes.map((path) => rootBundle.loadString(path)));
  loadedThemes.addAll(await Future.wait(customThemes
      .where((path) => File(path).existsSync())
      .map((path) => File(path).readAsString())));
  return loadedThemes.map((c) => Local.Theme.fromJson(loadYaml(c))).toList();
}

Future<Local.Theme> getCurrentTheme() async {
  SharedPreferences prefs = await getPreferences();
  List<Local.Theme> themes = await getThemes();
  String defaultTheme =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark
          ? 'dark'
          : 'light';
  Local.Theme systemTheme =
      themes.firstWhere((t) => t.id == 'defaults:$defaultTheme');
  return themes.firstWhere((t) => t.id == prefs.getString('selectedTheme')) ??
      systemTheme;
}

Future<String> getSelectedThemeId() async {
  SharedPreferences prefs = await getPreferences();
  return prefs.getString('selectedTheme');
}

Future<void> changeTheme(String themeId) async {
  SharedPreferences prefs = await getPreferences();
  List<Local.Theme> themes = await getThemes();
  if (themes.firstWhere((t) => t.id == themeId) == null) return;
  await prefs.setString('selectedTheme', themeId);
}

Future<String> registerTheme(String path) async {
  if (path == null ||
      ['.yaml', '.yml'].where((e) => path.endsWith(e)).length < 1)
    return 'bad filetype';
  SharedPreferences prefs = await getPreferences();
  List<Local.Theme> themes = await getThemes();
  String newThemeId = loadYaml(await File(path).readAsString())['id'];
  if (themes.map((t) => t.id).contains(newThemeId)) return 'duplicated ID';
  List<String> currentThemes = prefs.getStringList('customThemes');
  currentThemes.add(path);
  await prefs.setStringList('customThemes', currentThemes);
  return '';
}

Future<String> removeTheme(String themeId) async {
  if (themeId == null || themeId.startsWith('defaults:'))
    return 'can\'t remove default themes';
  SharedPreferences prefs = await getPreferences();
  List<String> customThemes = await Future.wait(prefs
      .getStringList('customThemes')
      .where((path) => File(path).existsSync())
      .map((path) => File(path).readAsString()));
  List<Local.Theme> loadedCustomThemes =
      customThemes.map((c) => Local.Theme.fromJson(loadYaml(c))).toList();
  Local.Theme theme = loadedCustomThemes.firstWhere((t) => t.id == themeId);
  int themeIndex = loadedCustomThemes.indexWhere((t) => t.id == themeId);
  if (theme == null) return 'couldn\'t find theme';
  if (prefs.getString('selectedTheme') == theme.id) {
    String defaultTheme =
        SchedulerBinding.instance.window.platformBrightness == Brightness.dark
            ? 'dark'
            : 'light';
    await prefs.setString('selectedTheme', 'defaults:$defaultTheme');
  }
  List<String> currentThemes = prefs.getStringList('customThemes');
  currentThemes.removeAt(themeIndex);
  await prefs.setStringList('customThemes', currentThemes);
  return '';
}
