import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';

import '../utils/theme/theme_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.topPadding,
    this.bottomPadding,
  });
  final double? topPadding;
  final double? bottomPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding ?? 20.h, bottom: bottomPadding ?? 20.h),
      child: Container(
        color:(ThemeManager.instance.themeMode == ThemeMode.light) ? null:CustomColor.whiteShadoColor.withOpacity(0.15) ,
        height: 1.sp,

        width: MyFunction.getWidth(context),
        decoration:
        (ThemeManager.instance.themeMode == ThemeMode.light) ?   BoxDecoration(gradient: MyFunction.lightSelectedGradBackGround()) : null,
      ),
    );
  }
}
