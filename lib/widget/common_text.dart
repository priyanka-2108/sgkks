import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';

class CommonTextWidget extends StatelessWidget {
  const CommonTextWidget({
    super.key,
    this.fontSize,
    this.fontWeight,
    required this.title,
    this.color,
    this.maxLines,
    this.textAlign,
    this.fontFamily,
  });
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String title;
  final int? maxLines;
  final TextAlign? textAlign;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize: fontSize ?? 16.sp,
          color: color ?? Theme.of(context).secondaryColor,
          fontWeight: fontWeight ?? FontWeight.w400,
          fontFamily: fontFamily ?? 'Roboto'),
    );
  }
}

class CommonTextStleWidget extends StatelessWidget {
  const CommonTextStleWidget({
    super.key,
    this.fontSize,
    this.fontWeight,
    required this.title,
    this.color,
    this.letterSpacing,
    this.height,
    this.fontFamily,
    this.textAlign,
  });
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String title;
  final double? letterSpacing;
  final double? height;
  final String? fontFamily;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: TextStyle(
          fontFamily: fontFamily ?? 'Roboto',
          letterSpacing: letterSpacing,
          height: height,
          fontSize: fontSize ?? 16.sp,
          color: color ?? Theme.of(context).secondaryColor,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
