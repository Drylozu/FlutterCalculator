import './theme.dart';

Theme darkTheme = Theme(
  id: 'defaults:dark',
  displayName: 'Dark',
  author: 'Drylozu',
  notificationBar: Bar(
    background: NormalColor(
      color: 0x000000,
      opacity: 0.38,
    ),
    iconsColor: 'white',
  ),
  navigationBar: Bar(
    background: NormalColor(
      color: 0x000000,
      opacity: 0.87,
    ),
    iconsColor: 'white',
  ),
  background: MainBackground(
    color: 0x303030,
    opacity: 1,
    imageUrl: null,
    imageBlur: 0,
  ),
  settingsButton: NormalColor(
    color: 0xFFFFFF,
    opacity: 1,
  ),
  resultText: NormalColor(
    color: 0xFFFFFF,
    opacity: 1,
  ),
  preResultText: NormalColor(
    color: 0xFFFFFF,
    opacity: 1,
  ),
  gridBorders: NormalColor(
    color: 0x000000,
    opacity: 0.12,
  ),
  numericPad: NumericPad(
    text: NormalColor(
      color: 0xFFFFFF,
      opacity: 1,
    ),
    exitButton: NormalColor(
      color: 0xFF2222,
      opacity: 1,
    ),
    resultButton: NormalColor(
      color: 0x424242,
      opacity: 1,
    ),
  ),
  settings: Settings(
    bar: SettingsBar(
      background: NormalColor(
        color: 0x000000,
        opacity: 1,
      ),
      text: NormalColor(
        color: 0xFFFFFF,
        opacity: 1,
      ),
    ),
    title: NormalColor(
      color: 0xFFFFFF,
      opacity: 1,
    ),
    subtitle: NormalColor(
      color: 0xFFFFFF,
      opacity: 0.6,
    ),
  ),
);

Theme lightTheme = Theme(
  id: 'defaults:light',
  displayName: 'Light',
  author: 'Drylozu',
  notificationBar: Bar(
    background: NormalColor(
      color: 0xFAFAFA,
      opacity: 1,
    ),
    iconsColor: 'black',
  ),
  navigationBar: Bar(
    background: NormalColor(
      color: 0xFAFAFA,
      opacity: 1,
    ),
    iconsColor: 'black',
  ),
  background: MainBackground(
    color: 0xFAFAFA,
    opacity: 1,
    imageUrl: null,
    imageBlur: 0,
  ),
  settingsButton: NormalColor(
    color: 0x000000,
    opacity: 1,
  ),
  resultText: NormalColor(
    color: 0x000000,
    opacity: 0.87,
  ),
  preResultText: NormalColor(
    color: 0x000000,
    opacity: 0.87,
  ),
  gridBorders: NormalColor(
    color: 0x000000,
    opacity: 0.12,
  ),
  numericPad: NumericPad(
    text: NormalColor(
      color: 0x000000,
      opacity: 1,
    ),
    exitButton: NormalColor(
      color: 0xFF2222,
      opacity: 1,
    ),
    resultButton: NormalColor(
      color: 0xFFFFFF,
      opacity: 1,
    ),
  ),
  settings: Settings(
    bar: SettingsBar(
      background: NormalColor(
        color: 0xFFFFFF,
        opacity: 1,
      ),
      text: NormalColor(
        color: 0x000000,
        opacity: 1,
      ),
    ),
    title: NormalColor(
      color: 0x000000,
      opacity: 1,
    ),
    subtitle: NormalColor(
      color: 0x000000,
      opacity: 0.6,
    ),
  ),
);