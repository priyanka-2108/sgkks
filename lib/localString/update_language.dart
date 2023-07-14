import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottomSheet/my_bottom_sheet.dart';
import '../shared_preference/shared_preference.dart';

class UpdateLang {
  static final List locale = [
    {
      'name': "englishText".tr,
      'locale': const Locale('en', 'US'),
      'key': "englishText"
    },
    {
      'name': "gujaratiText".tr,
      'locale': const Locale('gu', 'IN'),
      'key': "gujaratiText"
    },
  ];

  static updateLanguage(Locale locale, [bool? isBack]) async {
    if (isBack == true) {
      Get.back();
    }

    Get.updateLocale(locale);
// print("getLocale--->${Get.locale}");
  }
}
