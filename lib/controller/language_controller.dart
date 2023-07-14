import 'dart:convert';
import 'package:get/get.dart';
import '../shared_preference/shared_preference.dart';

class LanguageController extends GetxController implements GetxService {
  var localeIndex = 0.obs;
  static Map<String, dynamic> jsonString = {
    "name": "englishText".tr,
    "locale": "en_US",
    'key': "englishText"
  };
  static String? getTranslation =
      MySharedPreference.prefs.getString('localeTranslationStore') ??
          jsonEncode(jsonString);
  static Map<String, dynamic> userMap =
      jsonDecode(getTranslation!) as Map<String, dynamic>;

  var selectedLanguage = "${userMap["key"]}".tr.obs;

  List<String> languageList = ["englishText".tr, "gujaratiText".tr].obs;
}
