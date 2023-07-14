import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../translation/en_us.dart';
import '../translation/gu_in.dart';
class LocaleString extends Translations{




  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    //ENGLISH LANGUAGE
    'en_US':enUsLocale,
    //HINDI LANGUAGE
    'gu_IN':guInLocale,

  };
}
