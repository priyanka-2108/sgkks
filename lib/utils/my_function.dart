import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/onboarding/model/avatar_position.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_string.dart';

import '../shared_preference/shared_preference.dart';

class MyFunction {
  static BoxDecoration imageBackGround(String asset) {
    return BoxDecoration(
      image: DecorationImage(image: AssetImage(asset), fit: BoxFit.fill),
    );
  }

  static BoxDecoration bottomSheetBackGround(double? radius,BuildContext context,
      {bool isAll = false}) {
    return BoxDecoration(
        color: Theme.of(context).customPrimaryColor,
        borderRadius: isAll
            ? BorderRadius.all(Radius.circular(15.sp))
            : BorderRadius.only(
                topLeft: Radius.circular(radius ?? 30.0.sp),
                topRight: Radius.circular(radius ?? 30.0.sp)));
  }

  replaceScreenAfter(BuildContext context, String route,[Object? arguments]) {
    Navigator.of(context).pushReplacementNamed(route,arguments:arguments);
  }

  static replaceScreen(BuildContext context, String route,[Object? arguments]) {
    Navigator.of(context).pushNamed(route,arguments:arguments);

  }

  static backFromScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  static getHight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static RoundedRectangleBorder getRoundedRectangleBorder(
      {double? radius, bool isAll = false}) {
    return RoundedRectangleBorder(
      borderRadius: isAll
          ? BorderRadius.all(Radius.circular(15.sp))
          : BorderRadius.vertical(
              top: Radius.circular(30.sp),
            ),
    );
  }

  static LinearGradient lightSelectedGradBackGround() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColor.linearPrimaryColor.withOpacity(0.15),
          CustomColor.linearSecondaryColor.withOpacity(0.15),
        ]);
  }

  static LinearGradient selectedGradBackGround() {
    return  const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColor.linearPrimaryColor,
          CustomColor.linearSecondaryColor,
        ]);
  }


  static LinearGradient blackGrdBackGround() {
    return  LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColor.blackShadeColor,
          CustomColor.blackShadeColor.withOpacity(0.8),
        ]);
  }
  static LinearGradient boxGrdBackGround() {
    return  const LinearGradient(
        // begin: Alignment.topCenter,
        // end: Alignment.bottomCenter,
        colors: [
        Color(0xFFF9FAFD),
          CustomColor.secondaryColor2,
        ]);
  }
  static LinearGradient getGradColor() {
    return  const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          CustomColor.linearPrimaryColor,
          CustomColor.linearSecondaryColor,
        ]);
  }

  static TextStyle getGradientText({double? fontSize, FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: fontSize ?? 16.0,
        fontWeight: fontWeight ?? FontWeight.w400,
        foreground: Paint()
          ..shader = MyFunction.getGradColor()
              .createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)));
  }

  static List<OnboardingPageView> getOnboardingPageViewList() {
    String getTranslation =
    MySharedPreference.prefs.getString('localeTranslationStore')!;

    Map<String, dynamic> userMap =
    jsonDecode(getTranslation) as Map<String, dynamic>;

   var locale = userMap['locale'];
    return [
      OnboardingPageView(
        textFirstLine: "bePartOfSomethingBiggerTest".tr,
        textSecondLineStart: "joinText".tr,
        textSecondLineMiddle:"sgkksText".tr,
        textSecondLineEnd: "now".tr,
      ),
      OnboardingPageView(
        textFirstLine: "findYourFriendText".tr,
        textSecondLineStart: "withLikeText".tr,
        textSecondLineMiddle: "mindedPeopleText".tr,
        textSecondLineEnd: "",
        isSecond:true,
        isLang: locale,
      ),
      OnboardingPageView(
        textFirstLine: "exprienceMoreText".tr,
        textSecondLineStart: "joinOurText".tr,
        textSecondLineMiddle: "sgkksTodayText".tr,
        textSecondLineEnd: "",
      ),
      OnboardingPageView(
        textFirstLine: "exprienceBestText".tr,
        textSecondLineStart: "communityLivingText".tr,
        textSecondLineMiddle: "joinUsText".tr,
        textSecondLineEnd: "",
      ),
    ];
  }

  static BoxShadow getBoxShadow(
      {double? dx,
      double? dy,
      double? blurRadius,
      double? spreadRadius,
      Color? color,
        BlurStyle? blurStyle,}) {
    return BoxShadow(
      color: color ?? CustomColor.shadowColor.withOpacity(0.1),
      blurRadius: blurRadius ?? 10.0,
      spreadRadius: spreadRadius ?? 5.0,
      offset: Offset(dx ?? 0.0, dy ?? 0.0),
        blurStyle:blurStyle ?? BlurStyle.normal,

    );
  }
}
