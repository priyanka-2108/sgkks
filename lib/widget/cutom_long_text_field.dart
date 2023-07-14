import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/widget/common_text.dart';

class customLongTextField extends StatelessWidget {
  const customLongTextField({
    super.key,
    required this.hintText,
    this.hight,
    required this.labelText,
    this.fontSize,
    this.color,
    this.fontFamily, this.dx, this.dy, this.blurRadius, this.spreadRadius, this.boxColor,
  });
  final String hintText;
  final double? hight;
  final String labelText;
  final double? fontSize;
  final Color? color;
  final String? fontFamily;
  final double? dx;
  final double? dy;
  final double? blurRadius;
  final double? spreadRadius;

  final Color? boxColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 13.h),
          child: CommonTextWidget(
            title: labelText,
            fontSize: fontSize ?? 14.sp,
            fontWeight: FontWeight.w500,
            color: color ?? Theme.of(context).secondaryColor,
          ),
        ),
        Container(
          height: hight ?? 87.h,
          width: MyFunction.getWidth(context),
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color:boxColor ??Theme.of(context).customPrimaryColor,
            boxShadow: [
              MyFunction.getBoxShadow(
                  dx:dx ?? 0, dy:dy?? 0, blurRadius:blurRadius?? 25, spreadRadius:spreadRadius?? 1.0,)
            ],
            border: Border.all(color: Theme.of(context).customPrimaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(8.sp),
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              isDense: true,
              prefixIconConstraints: const BoxConstraints(),
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontFamily: fontFamily ?? 'Roboto',
                color: CustomColor.greyColor,
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
