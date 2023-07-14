import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localString/update_language.dart';

class MySharedPreference {
  static late SharedPreferences prefs;
  static late Locale localeTranslation;

  static storeMethod() {
    Map<String, dynamic> jsonString = {
      "name": "englishText".tr,
      "locale": "en_US",
      'key': "englishText"
    };

    String getTranslation =
        prefs.getString('localeTranslationStore') ?? jsonEncode(jsonString);

    Map<String, dynamic> userMap =
        jsonDecode(getTranslation) as Map<String, dynamic>;

    var splitString = userMap['locale'].toString().split("_");
    localeTranslation = Locale(splitString.first, splitString.last);
    return UpdateLang.updateLanguage(
      localeTranslation,
    );
  }
}
