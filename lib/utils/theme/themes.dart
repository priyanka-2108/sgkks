import 'package:flutter/material.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';
import '../custom_color.dart';

class Themes {
  // final _box = GetStorage();
  // final _key = 'isDarkMode';

  // _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  // bool _loadThemeFromBox() => _box.read(_key) ?? false;

  // ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  // void switchTheme() {
  //   Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
  //   _saveThemeToBox(!_loadThemeFromBox());
  // }

  static final light = ThemeData.light().copyWith(
    primaryColor: (ThemeManager.instance.themeMode == ThemeMode.light
        ? Colors.black
        : Colors.white),
    scaffoldBackgroundColor: (ThemeManager.instance.themeMode == ThemeMode.light
        ? Colors.white
        : CustomColor.secondaryColor2),
    // cardColor: CustomColor.linearSecondaryColor,

    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        color: (ThemeManager.instance.themeMode == ThemeMode.light
            ? Colors.white
            : CustomColor.secondaryColor2),
        iconTheme:  IconThemeData(color: CustomColor.linearPrimaryColor)),

    textTheme:
    ThemeData.dark().textTheme.apply(

          bodyColor: Colors.white,
          fontFamily: 'Roboto',
        ),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: (ThemeManager.instance.themeMode == ThemeMode.light
        ? Colors.white
        : CustomColor.secondaryColor2),
    // scaffoldBackgroundColor: CustomColor.secondaryColor,
    // cardColor: CustomColor.accentColor,

    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        color: CustomColor.bgColor,
        iconTheme: IconThemeData(color: (ThemeManager.instance.themeMode == ThemeMode.light
            ? Colors.white
            : CustomColor.secondaryColor2))),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.black,
          fontFamily: 'Roboto',
        ),
  );
}

