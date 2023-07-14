import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';

class DottedBoaderWidget extends StatelessWidget {
  const DottedBoaderWidget({
    super.key,
    this.color,
    this.dashPattern,
    this.hight,
  });
  final Color? color;
  final List<double>? dashPattern;
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: dashPattern ?? [4, 8, 4, 8],
      borderType: BorderType.RRect,
      radius: Radius.circular(7.sp),
      color: color ?? CustomColor.linearPrimaryColor,
      strokeWidth: 2,
      strokeCap: StrokeCap.butt,
      child: Container(
        color: Theme.of(context).skyBlueColor,
        height: hight ?? 130.h,
      ),
    );
  }
}
