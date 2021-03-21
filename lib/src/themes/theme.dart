import 'package:yaml/yaml.dart';

class Theme {
  String id;
  String displayName;
  String author;
  Bar notificationBar;
  Bar navigationBar;
  MainBackground background;
  NormalColor settingsButton;
  NormalColor resultText;
  NormalColor preResultText;
  NormalColor gridBorders;
  NumericPad numericPad;
  Settings settings;

  Theme(
      {this.id,
      this.displayName,
      this.author,
      this.notificationBar,
      this.navigationBar,
      this.background,
      this.settingsButton,
      this.resultText,
      this.preResultText,
      this.gridBorders,
      this.numericPad,
      this.settings});

  Theme.fromJson(YamlMap json) {
    id = json['id'];
    displayName = json['display_name'] ?? 'Unknown';
    author = json['author'] ?? 'Unknown';
    notificationBar = json['notification_bar'] != null
        ? Bar.fromJson(json['notification_bar'])
        : Bar.fromJson(YamlMap());
    navigationBar = json['navigation_bar'] != null
        ? Bar.fromJson(json['navigation_bar'])
        : Bar.fromJson(YamlMap());
    background = json['background'] != null
        ? MainBackground.fromJson(json['background'])
        : MainBackground.fromJson(YamlMap());
    settingsButton = json['settings_button'] != null
        ? NormalColor.fromJson(json['settings_button'])
        : NormalColor.fromJson(YamlMap());
    resultText = json['result_text'] != null
        ? NormalColor.fromJson(json['result_text'])
        : NormalColor.fromJson(YamlMap());
    preResultText = json['pre_result_text'] != null
        ? NormalColor.fromJson(json['pre_result_text'])
        : NormalColor.fromJson(YamlMap());
    gridBorders = json['grid_borders'] != null
        ? NormalColor.fromJson(json['grid_borders'])
        : NormalColor.fromJson(YamlMap());
    numericPad = json['numeric_pad'] != null
        ? NumericPad.fromJson(json['numeric_pad'])
        : NumericPad.fromJson(YamlMap());
    settings = json['settings'] != null
        ? Settings.fromJson(json['settings'])
        : Settings.fromJson(YamlMap());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['display_name'] = this.displayName;
    data['author'] = this.author;
    data['notification_bar'] = this.notificationBar.toJson();
    data['navigation_bar'] = this.navigationBar.toJson();
    data['background'] = this.background.toJson();
    data['settings_button'] = this.settingsButton.toJson();
    data['result_text'] = this.resultText.toJson();
    data['pre_result_text'] = this.preResultText.toJson();
    data['grid_borders'] = this.gridBorders.toJson();
    data['numeric_pad'] = this.numericPad.toJson();
    data['settings'] = this.settings.toJson();
    return data;
  }
}

class Bar {
  NormalColor background;
  String iconsColor;

  Bar({this.background, this.iconsColor});

  Bar.fromJson(YamlMap json) {
    background = json['background'] != null
        ? NormalColor.fromJson(json['background'])
        : NormalColor.fromJson(YamlMap());
    iconsColor = <String>['white', 'black']
            .contains(json['icons_color'].toString().toLowerCase())
        ? json['icons_color'].toString().toLowerCase()
        : 'white';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['background'] = this.background.toJson();
    data['icons_color'] = this.iconsColor;
    return data;
  }
}

class MainBackground {
  int color;
  double opacity;
  String imageUrl;
  double imageBlur;

  MainBackground({this.color, this.opacity, this.imageUrl, this.imageBlur});

  MainBackground.fromJson(YamlMap json) {
    color = json['color'] ?? 0x303030;
    opacity = json['opacity'] is int
        ? (json['opacity'] as int).toDouble()
        : (json['opacity'] is double ? json['opacity'] : 1.0);
    imageUrl = json['image_url'];
    imageBlur = json['image_blur'] is int
        ? (json['image_blur'] as int).toDouble()
        : (json['image_blur'] is double ? json['image_blur'] : 0.0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['color'] = this.color;
    data['opacity'] = this.opacity;
    data['image_url'] = this.imageUrl;
    data['image_blur'] = this.imageBlur;
    return data;
  }
}

class NumericPad {
  NormalColor text;
  NormalColor exitButton;
  NormalColor resultButton;

  NumericPad({this.text, this.exitButton, this.resultButton});

  NumericPad.fromJson(YamlMap json) {
    text = json['text'] != null
        ? NormalColor.fromJson(json['text'])
        : NormalColor.fromJson(YamlMap());
    exitButton = json['exit_button'] != null
        ? NormalColor.fromJson(json['exit_button'])
        : NormalColor.fromJson(YamlMap());
    resultButton = json['result_button'] != null
        ? NormalColor.fromJson(json['result_button'])
        : NormalColor.fromJson(YamlMap());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text.toJson();
    data['exit_button'] = this.exitButton.toJson();
    data['result_button'] = this.resultButton.toJson();
    return data;
  }
}

class Settings {
  SettingsBar bar;
  NormalColor title;
  NormalColor subtitle;

  Settings({this.bar, this.title, this.subtitle});

  Settings.fromJson(YamlMap json) {
    bar = json['bar'] != null
        ? SettingsBar.fromJson(json['bar'])
        : SettingsBar.fromJson(YamlMap());
    title = json['title'] != null
        ? NormalColor.fromJson(json['title'])
        : NormalColor.fromJson(YamlMap());
    subtitle = json['subtitle'] != null
        ? NormalColor.fromJson(json['subtitle'])
        : NormalColor.fromJson(YamlMap());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bar'] = this.bar.toJson();
    data['title'] = this.title.toJson();
    data['subtitle'] = this.subtitle.toJson();
    return data;
  }
}

class SettingsBar {
  NormalColor background;
  NormalColor text;

  SettingsBar({this.background, this.text});

  SettingsBar.fromJson(YamlMap json) {
    background = json['background'] != null
        ? NormalColor.fromJson(json['background'])
        : NormalColor.fromJson(YamlMap());
    text = json['text'] != null
        ? NormalColor.fromJson(json['text'])
        : NormalColor.fromJson(YamlMap());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['background'] = this.background.toJson();
    data['text'] = this.text.toJson();
    return data;
  }
}

class NormalColor {
  int color;
  double opacity;

  NormalColor({this.color, this.opacity});

  NormalColor.fromJson(YamlMap json) {
    color = json['color'] ?? 0xFFFFFF;
    opacity = json['opacity'] is int
        ? (json['opacity'] as int).toDouble()
        : (json['opacity'] is double ? json['opacity'] : 1.0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['color'] = this.color;
    data['opacity'] = this.opacity;
    return data;
  }
}
