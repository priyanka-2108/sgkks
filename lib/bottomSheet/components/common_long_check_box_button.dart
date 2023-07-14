import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';

import '../../utils/theme/theme_manager.dart';

class CommonLongCheckBoxButton extends StatefulWidget {
  const CommonLongCheckBoxButton(
      {super.key, required this.title, required this.isLanguageSelected});
  final String title;
  final bool isLanguageSelected;

  @override
  State<CommonLongCheckBoxButton> createState() => _CommonLongCheckBoxButtonState();
}

class _CommonLongCheckBoxButtonState extends State<CommonLongCheckBoxButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: (ThemeManager.instance.themeMode == ThemeMode.light)
            ? CustomColor.whiteShadoColor
            : CustomColor.whiteShadoColor.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
              spreadRadius: 0,
              blurRadius: 15.sp,
              offset: const Offset(0, 0),
              color: CustomColor.shadowColor.withOpacity(0.1),
              blurStyle: BlurStyle.outer)
        ],
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        gradient:
        widget.isLanguageSelected ? MyFunction.lightSelectedGradBackGround() :null,
      ),
      child: Container(
        padding: EdgeInsets.all(0.5.sp),
        decoration: BoxDecoration(
          border: widget.isLanguageSelected
              ? Border.all(
                  color: CustomColor.linearSecondaryColor.withOpacity(0.5))
              : null,
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          gradient: widget.isLanguageSelected
              ? MyFunction.lightSelectedGradBackGround()
              : null,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 13.h),
          child: Text(
            widget.title,
            style:
            widget.isLanguageSelected
                    ? MyFunction.getGradientText()
                    :  const TextStyle(
                        color: CustomColor.greyColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),

          ),
        ),
      ),
    );
  }
}
