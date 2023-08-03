import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isBorder = false, this.width,

  });
  final String title;
  final VoidCallback onTap;
  final bool isBorder;
  final double? width;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width:width ?? MyFunction.getWidth(context),
        decoration: BoxDecoration(
          border: Border.all(
              color: CustomColor.linearSecondaryColor.withOpacity(0.5),
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30.sp)),
          gradient: isBorder
              ?  LinearGradient(
                  colors: [CustomColor.transparent, CustomColor.transparent])
              : MyFunction.getGradColor(),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 13.h),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                      fontSize: 18.sp,
                      color: isBorder
                          ? CustomColor.linearSecondaryColor
                          : CustomColor.whiteColor,
                      fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
class CommonOutlineButton extends StatelessWidget {
  const CommonOutlineButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isBorder = false,
    this.width,
  });
  final String title;
  final VoidCallback onTap;
  final bool isBorder;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width:width?? MyFunction.getWidth(context),

        decoration: BoxDecoration(
          border: Border.all(
              color: CustomColor.linearSecondaryColor.withOpacity(0.6),
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30.sp)),
          gradient:
               const LinearGradient(
              colors: [CustomColor.transparent, CustomColor.transparent])
            ,
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 13.h, 20.w, 13.h),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18.sp,
                  color:CustomColor.linearSecondaryColor.withOpacity(0.6)
                      ,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
class CommonSmallCallButton extends StatelessWidget {
  const CommonSmallCallButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isBorder = false, this.radius,

  });
  final String title;
  final VoidCallback onTap;
  final bool isBorder;

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.h,
        width:98 .w,
        decoration: BoxDecoration(
          border: Border.all(
              color: CustomColor.linearSecondaryColor.withOpacity(0.5),
              width: 2),
          borderRadius: BorderRadius.all(Radius.circular(radius ??30.sp)),
          gradient: isBorder
              ?  const LinearGradient(
              colors: [CustomColor.transparent, CustomColor.transparent])
              : MyFunction.getGradColor(),
        ),
        child: Center(
          child: Text(
            title,

            style: TextStyle(
                fontSize: 12.sp,

                color: isBorder
                    ? CustomColor.linearSecondaryColor
                    : CustomColor.whiteColor,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
