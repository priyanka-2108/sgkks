import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';
import 'package:sgkks/widget/common_text.dart';

class CustomAddPhotoWidget extends StatelessWidget {
  const CustomAddPhotoWidget(
      {super.key,
      required this.title,
      this.onTap,
      this.isBorderVisible = true, this.color});
  final String title;
  final Function()? onTap;
  final bool isBorderVisible;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: MyFunction.getWidth(context),
      padding: EdgeInsets.all(0.5.sp),
      decoration: BoxDecoration(
        color: Theme.of(context).customPrimaryColor,
        boxShadow: [
          MyFunction.getBoxShadow(
              dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
        ],
        border: isBorderVisible
            ? Border.all(
                color: CustomColor.linearSecondaryColor.withOpacity(0.5))
            : null,
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: CommonTextWidget(
                  title: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
              // if (isPreFixIcon) Image.asset(asset),
              InkWell(
                onTap: onTap,
                child: Container(
                  margin: EdgeInsets.only(left: 8.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(34.sp),
                      gradient: MyFunction.getGradColor()),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 5.h, 10.w, 5.h),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          color:
                              ThemeManager.instance.themeMode == ThemeMode.light
                                  ? Theme.of(context).customPrimaryColor
                                  : null,
                          size: 18.sp,
                        ),
                        CommonTextWidget(
                          color:
                              ThemeManager.instance.themeMode == ThemeMode.light
                                  ? Theme.of(context).customPrimaryColor
                                  : null,
                          title: "addText".tr,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
