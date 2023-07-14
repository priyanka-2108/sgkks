import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared_preference/shared_preference.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  /// private constructor
  ThemeManager();

  /// the one and only instance of this singleton
  static final instance = ThemeManager();
  get themeMode => _themeMode;
  toggleTheme(bool isDark) async {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }
storeToggleTheme(){
  bool  themeModeValue=  MySharedPreference.prefs.getBool('themeModeStore') ?? false;
 return  ThemeManager.instance.toggleTheme(themeModeValue);
}

getTheme(){
 bool getTheme = MySharedPreference.prefs.getBool('themeModeStore') ?? false;
 return getTheme;
}

}
