import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_button.dart';

class OnboardingTextWidget extends StatelessWidget {
  const OnboardingTextWidget({
    super.key,
    required this.textFirstLine,
    required this.textSecondLineStart,
    required this.textSecondLineMiddle,
    required this.textSecondLineEnd,
  });
  final String textFirstLine;
  final String textSecondLineStart;
  final String textSecondLineMiddle;
  final String textSecondLineEnd;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          textFirstLine,
          textAlign: TextAlign.center,
          style: TextStyle(
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
                textSecondLineStart,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.sp,
                    color:Theme.of(context).secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                child: Text(
                  textSecondLineMiddle,
                  textAlign: TextAlign.center,
                  style: MyFunction.getGradientText(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                textSecondLineEnd,
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
