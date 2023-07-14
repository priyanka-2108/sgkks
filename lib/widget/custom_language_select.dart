import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/custom_color.dart';
import '../utils/my_function.dart';

class CustomLanguageSelect extends StatefulWidget {
  final String labelText;
  final String title;
  final String asset;
  final TextEditingController textEditingController;
  final double? width;
  final bool isDropDown;
  final bool isBoxSelected;
  final VoidCallback? onTap;

  const CustomLanguageSelect(
      {super.key,
      required this.labelText,
      required this.title,
      required this.asset,
      required this.textEditingController,
      this.isDropDown = false,
      this.width,
      this.isBoxSelected = false,
      this.onTap});

  @override
  State<CustomLanguageSelect> createState() => _CustomLanguageSelectState();
}

class _CustomLanguageSelectState extends State<CustomLanguageSelect> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 45.h,
        width: widget.width ?? MyFunction.getWidth(context),
        padding: EdgeInsets.all(0.5.sp),
        decoration: BoxDecoration(
          color: widget.isBoxSelected
              ? CustomColor.linearSecondaryColor.withOpacity(0.1)
              : Theme.of(context).customPrimaryColor,
          boxShadow: [
            MyFunction.getBoxShadow(
                dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0)
          ],
          border: widget.isBoxSelected
              ? Border.all(
                  color: CustomColor.linearPrimaryColor.withOpacity(0.5))
              : null,
          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        ),
        child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        color: widget.isBoxSelected
                            ? CustomColor.linearPrimaryColor
                            : CustomColor.greyColor,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
