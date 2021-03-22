# Deivid's Calculator (FlutterCalculator)
A calculator in Flutter to perform simple mathematical expressions. **This application doesn't have support to mobile devices with iOS** =(.

**Template theme**: https://gist.github.com/Drylozu/9b72fbc8b7b58eb12915936eb256fd2c

## Screenshots

<img src="https://i.imgur.com/7j6EbO9.png" height="450em" /> <img src="https://i.imgur.com/UnlpUwF.png" height="450em" />

## Installation
1. Go to [releases page](https://github.com/Drylozu/FlutterCalculator/releases).
2. Find the last stable version.
3. Download the APK for your system (if you don't know what APK choose, download the _`app-release.apk`_).

## How to create/install a theme
0. Install FlutterCalculator with the steps listed above.
1. Save the template theme (see above) to a file like `[your theme name].yml`.
2. Edit the properties that you want (id, name, author, *background color* or *background image*).
3. Open FlutterCalculator, go to settings and `Load a new theme`.
4. Enjoy with your theme!

## Build your own APK
**Prerequisites**: you must have Flutter in your system.
1. Clone this repository (_`git clone https://github.com/Drylozu/FlutterCalculator.git`_).
2. Make your own digital signature for the APK (https://flutter.dev/docs/deployment/android#signing-the-app).
3. Install the dependencies running `flutter pub get`.
4. Build your APK with `flutter build apk`.