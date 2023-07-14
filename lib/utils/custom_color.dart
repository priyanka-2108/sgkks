import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';

import '../main.dart';

class CustomColor {
  static const Color linearPrimaryColor = Color(0xFF6595FF);
  static const Color bgColor = Color(0xFF343541);
  // static Color primaryColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light
  //         ? Colors.white
  //         : CustomColor.secondaryColor2);
  // static Color secondaryColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light
  //         ? Colors.black
  //         : Colors.white);

  static const Color transparent = Colors.transparent;
  static Color shadowColor = const Color(0xFF000000);
  static const Color greyColor = Color(0xFF8696AE);
  static const Color lightGreyColor = Color(0xFFD9D9D9);
  // static Color mediumGreyColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light
  //         ? const Color(0xFFCDD4DE)
  //         : secondaryColor2);
  // static Color skyBlueColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light
  //         ? normalWhiteShadeColor
  //         : secondaryColor2);
  // static const Color lightBlueColor = Color(0xFFD7E8F4);
  static const Color linearSecondaryColor = Color(0xFF407BFF);
  static const Color secondaryColor2 = Color(0xFF2B2C3D);
  static const Color whiteColor = Colors.white;

  static const Color deepGrayColor = Color(0xFF4F4F4F);
  static const Color primaryTextColor = Color(0xFF111111);
  static const Color normalWhiteShadeColor = Color(0xFFEBF1FF);
  // static Color blackColor = (ThemeManager.instance.themeMode == ThemeMode.light)
  //     ? blackShadeColor
  //     : whiteColor;
  static const Color lightWhiteColor = Color(0xFFF6F7F9);
  // static Color lightWhiteShadeColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? whiteShadoColor
  //         : secondaryColor2;
  static const Color lightBlueColor = Color(0xFF283A56);
  static const Color lightGreyShadeColor = Color(0xFF9CA6AE);
  static const Color redColor = Color(0xFFDC1515);
  static const Color greyShadeColor = Color(0xFFBAB7C0);
  static const Color lightedGreyShadeColor = greyShadeColor;
  static const Color whiteShadeColor = Color(0xFFEAF0FF);
  static const Color darkGreyColor = Color(0xFF8695AE);
  // static Color blueShadeColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? const Color(0xFF0B2347)
  //         : whiteColor;
  static const Color lightBlueShadeColor = Color(0xFF686175);
  static const Color lightBlackColor = Color(0xFF263238);
  static const Color whiteLightShadeColor = Color(0xFFF9FAFD);
  static const Color whiteShadoColor = Color(0xFFFAFBFF);

  // static Color whiteOpacityColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? blackShadeColor.withOpacity(0.8)
  //         : CustomColor.whiteColor.withOpacity(0.6);
  // static Color iconColor = (ThemeManager.instance.themeMode == ThemeMode.light)
  //     ? CustomColor.whiteShadoColor
  //     : blackShadeColor;
  // static Color backgroundColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? whiteShadoColor
  //         : CustomColor.whiteColor.withOpacity(0.2);

  // static Color whiteSearchColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? whiteShadoColor
  //         : CustomColor.whiteColor.withOpacity(0.15);
  // static Color whiteDotColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? lightGreyColor
  //         : lightGreyColor.withOpacity(0.3);
  static Color blackShadeColor = const Color(0xFF1B1E20);
  // static Color bottomNavigationBarColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? CustomColor.whiteColor
  //         : const Color(0xFF101A38);

  // static Color bottomSheetColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? iconWhiteColor
  //         : const Color(0xFF101A38);
  // static Color boxColor = (ThemeManager.instance.themeMode == ThemeMode.light)
  //     ? whiteLightShadeColor
  //     : secondaryColor2;
  // static Color iconBackColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? CustomColor.whiteShadoColor
  //         : CustomColor.whiteShadoColor.withOpacity(0.2);
  // static Color backIconColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? CustomColor.whiteColor
  //         : CustomColor.whiteColor.withOpacity(0.15);
  // static Color cardBackColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? whiteShadoColor
  //         : secondaryColor2;
  // static Color blueTextColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? lightBlueColor
  //         : whiteShadoColor;
  // static Color lightBlueTextColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? lightBlueColor
  //         : CustomColor.whiteColor;
  // static Color closeIconColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? lightBlackColor
  //         : CustomColor.whiteColor;
  // static Color skipTextColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? blackShadeColor
  //         : CustomColor.whiteShadoColor;
  // static Color skyTextColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? blackShadeColor
  //         : normalWhiteShadeColor;
  // static Color textFieldColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? whiteShadoColor
  //         : secondaryColor2;
  // static Color titleTextColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? lightBlackColor
  //         : whiteShadoColor;
  //
  // static Color boxBackColor =
  //     (ThemeManager.instance.themeMode == ThemeMode.light)
  //         ? CustomColor.whiteShadoColor
  //         : secondaryColor2;
}

extension LightThemeEx on ThemeData {
  Color get customPrimaryColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light
        ? CustomColor.whiteColor
        : CustomColor.secondaryColor2);
  }

  Color get secondaryColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light
        ? Colors.black
        : CustomColor.whiteColor);
  }

  Color get mediumGreyColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light
        ? const Color(0xFFCDD4DE)
        : CustomColor.secondaryColor2);
  }

  Color get skyBlueColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light
        ? CustomColor.normalWhiteShadeColor
        : CustomColor.secondaryColor2);
  }

  Color get blackColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.blackShadeColor
        : CustomColor.whiteColor;
  }

  Color get lightWhiteShadeColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.secondaryColor2;
  }

  Color get blueShadeColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? const Color(0xFF0B2347)
        : CustomColor.whiteColor;
  }

  Color get whiteOpacityColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.blackShadeColor.withOpacity(0.8)
        : CustomColor.whiteColor.withOpacity(0.6);
  }

  Color get iconColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.blackShadeColor;
  }

  Color get backgroundWhiteColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.whiteColor.withOpacity(0.2);
  }

  Color get whiteSearchColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.whiteColor.withOpacity(0.15);
  }

  Color get whiteDotColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.lightGreyColor
        : CustomColor.lightGreyColor.withOpacity(0.3);
  }

  Color get bottomNavigationBarColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteColor
        : const Color(0xFF101A38);
  }

  Color get bottomSheetColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : const Color(0xFF101A38);
  }

  Color get boxColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteLightShadeColor
        : CustomColor.secondaryColor2;
  }

  Color get iconBackColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.whiteShadoColor.withOpacity(0.2);
  }

  Color get backIconColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteColor
        : CustomColor.whiteColor.withOpacity(0.15);
  }

  Color get cardBackColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.secondaryColor2;
  }

  Color get blueTextColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.lightBlueColor
        : CustomColor.whiteShadoColor;
  }

  Color get lightBlueTextColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.lightBlueColor
        : CustomColor.whiteColor;
  }

  Color get closeIconColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.lightBlackColor
        : CustomColor.whiteColor;
  }

  Color get skipTextColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.blackShadeColor
        : CustomColor.whiteShadoColor;
  }

  Color get skyTextColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.blackShadeColor
        : CustomColor.normalWhiteShadeColor;
  }

  Color get textFieldColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.secondaryColor2;
  }

  Color get titleTextColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.lightBlackColor
        : CustomColor.whiteShadoColor;
  }

  Color get boxBackColor {
    return (ThemeManager.instance.themeMode == ThemeMode.light)
        ? CustomColor.whiteShadoColor
        : CustomColor.secondaryColor2;
  }


}
