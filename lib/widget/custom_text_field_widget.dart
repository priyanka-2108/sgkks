import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/widget/common_text.dart';

import '../utils/theme/theme_manager.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.asset,
      required this.textEditingController,
      this.isDropDown = false,
      this.width,
      this.isPreFixIcon = true,
      this.rightPadding,
      this.isSvgIcon = false, this.color, this.keyBoardType});
  final String labelText;
  final String hintText;
  final String asset;
  final TextEditingController textEditingController;
  final double? width;
  final bool isDropDown;
  final bool isPreFixIcon;
  final double? rightPadding;
  final bool isSvgIcon;
  final Color? color;
  final TextInputType? keyBoardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 13.h),
          child: CommonTextWidget(
              title: labelText, fontSize: 14.sp, fontWeight: FontWeight.w400,color: color?? null,),
        ),
        Container(
          height: 45.h,
          width: width ?? MyFunction.getWidth(context),
          padding: EdgeInsets.all(0.5.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).textFieldColor,
            boxShadow:(ThemeManager.instance.themeMode == ThemeMode.light) ? [
              MyFunction.getBoxShadow(
                  dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1),),
            ]: null,
            border: Border.all(
                color: CustomColor.linearSecondaryColor.withOpacity(0.2)),
            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
          ),
          child: Padding(
              padding:
                  EdgeInsets.fromLTRB(16.w, 0.h, rightPadding ?? 16.w, 0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (isPreFixIcon)
                    isSvgIcon
                        ? SvgPicture.asset(
                            asset,
                          )
                        : Image.asset(asset),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: TextField(
                        controller: textEditingController,
                        keyboardType:keyBoardType,

                        style:  TextStyle(
                          color: CustomColor.greyColor,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(

                            isDense: true,
                            prefixIconConstraints: const BoxConstraints(),
                            contentPadding: EdgeInsets.zero,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            hintText: hintText,
                            hintStyle: TextStyle(
                              color: CustomColor.greyColor,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                    ),
                  ),
                  if (isDropDown) Image.asset(AssetString.dropDownIcon)
                ],
              )),
        ),
      ],
    );
  }
}
