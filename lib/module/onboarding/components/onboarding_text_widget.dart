import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_button.dart';

import '../../../shared_preference/shared_preference.dart';

class OnboardingTextWidget extends StatefulWidget {
  const OnboardingTextWidget({
    super.key,
    required this.textFirstLine,
    required this.textSecondLineStart,
    required this.textSecondLineMiddle,
    required this.textSecondLineEnd, this.isSecond, this.isLang,
  });
  final String textFirstLine;
  final String textSecondLineStart;
  final String textSecondLineMiddle;
  final String textSecondLineEnd;
  final bool? isSecond;
  final String? isLang;

  @override
  State<OnboardingTextWidget> createState() => _OnboardingTextWidgetState();
}

class _OnboardingTextWidgetState extends State<OnboardingTextWidget> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.textFirstLine,
          textAlign: TextAlign.center,
          style:widget.isLang == "gu_IN"  ?MyFunction.getGradientText(
              fontSize: 22, fontWeight: FontWeight.w600):   TextStyle(
              fontSize: 22.sp,
              color: Theme.of(context).secondaryColor,
              fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.textSecondLineStart,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.sp,
                    color:Theme.of(context).secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(left:widget.isSecond == true ? 0.w:  8.w, right: 8.w),
                child: Text(
                  widget.textSecondLineMiddle,
                  textAlign: TextAlign.center,
                  style:widget.isLang == "gu_IN"  ?  TextStyle(
                      fontSize: 22.sp,
                      color:Theme.of(context).secondaryColor,
                      fontWeight: FontWeight.w600):  MyFunction.getGradientText(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                widget.textSecondLineEnd,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.sp,
                    color:Theme.of(context).secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
