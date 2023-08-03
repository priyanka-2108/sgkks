import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/widget/common_text.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton(
      {super.key,
      required this.labelText,
      required this.title,
      required this.asset,
      required this.textEditingController,
      this.isDropDown = false,
      this.width,
      this.isPreFixIcon = true,
      this.rightPadding,
      this.isSvgIcon = false,
      this.isBoxSelected = false,
      this.onTap, this.color});
  final String labelText;
  final String title;
  final String asset;
  final TextEditingController textEditingController;
  final double? width;
  final bool isDropDown;
  final bool isPreFixIcon;
  final double? rightPadding;
  final bool isSvgIcon;
  final bool isBoxSelected;
  final VoidCallback? onTap;
  final Color? color;

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 13.h),
            child: CommonTextWidget(
                title: widget.labelText,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,color:widget.color,),
          ),
          Container(
            height: 45.h,
            width: widget.width ?? MyFunction.getWidth(context),
            padding: EdgeInsets.all(0.5.sp),
            decoration: BoxDecoration(

              color: widget.isBoxSelected ? CustomColor.linearSecondaryColor.withOpacity(0.1): Theme.of(context).customPrimaryColor,
              boxShadow: [
                MyFunction.getBoxShadow(

                    spreadRadius: 0,
                    blurRadius: 15.sp,

                    color: CustomColor.shadowColor.withOpacity(0.1),
                    blurStyle: BlurStyle.outer

                    // dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0,
              )
              ],
              border: Border.all(
                  color: widget.isBoxSelected ? CustomColor.linearSecondaryColor: CustomColor.linearSecondaryColor.withOpacity(0.2)),
              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
            ),
            child: Padding(
                padding: EdgeInsets.fromLTRB(
                    16.w, 0.h, widget.rightPadding ?? 16.w, 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.isPreFixIcon)
                      widget.isSvgIcon
                          ? SvgPicture.asset(
                              widget.asset,
                            )
                          : Image.asset(widget.asset),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w, right: 8.w),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: CustomColor.greyColor,
                            fontSize: 14.0.sp,
                            fontWeight:
                                 FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
