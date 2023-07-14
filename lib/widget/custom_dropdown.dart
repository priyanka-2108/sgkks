import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/widget/common_text.dart';

class CustomDropDownWidget extends StatelessWidget {
  const CustomDropDownWidget(
      {super.key,
      required this.title,
      required this.labelText,
      this.width,
      this.height, this.color});
  final String title;
  final String labelText;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title Text
        Padding(
          padding: EdgeInsets.only(bottom: 13.h),
          child: CommonTextWidget(
              title: labelText, fontSize: 14.sp, fontWeight: FontWeight.w400,color: color,),
        ),
        //dropdown
        Container(
          height: height ?? 50.h,
          width: width ?? MyFunction.getWidth(context),
          padding: EdgeInsets.all(0.5.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).customPrimaryColor,
            boxShadow: [
              MyFunction.getBoxShadow(
                  dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
            ],
            border: Border.all(
                color: CustomColor.linearSecondaryColor.withOpacity(0.2)),
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
                    color: CustomColor.greyColor,
                    title: title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Image.asset(AssetString.dropDownIcon,color: CustomColor.whiteShadoColor,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
