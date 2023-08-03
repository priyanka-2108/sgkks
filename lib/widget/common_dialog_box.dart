import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sgkks/widget/common_text.dart';
import '../utils/custom_color.dart';
import '../utils/my_function.dart';
import '../utils/my_string.dart';

class CommonDialogBox extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;
  final double? imagePadding;
  final double? textPadding;

  const CommonDialogBox(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image,
      this.imagePadding,
      this.textPadding});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).bottomNavigationBarColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //close button
          Container(
            padding: EdgeInsets.only(right: 8.w),
            width: double.infinity,
            child: IconButton(
              alignment: Alignment.bottomRight,
              onPressed: () {
                MyFunction.backFromScreen(context);
              },
              icon: Icon(
                Icons.close,
                size: 22.h,
                color: Theme.of(context).closeIconColor,
              ),
            ),
          ),
          //image

          Padding(
            padding: EdgeInsets.only(top: imagePadding ?? 0.h),
            child: SizedBox(
              height: 100.h,
              child: OverflowBox(
                minHeight: 100.h,
                maxHeight: 170.w,
                child: Lottie.asset(
                  image,
                ),
              ),
            ),
          ),

          // Image.asset(image),
          //title Text

          Padding(
            padding: EdgeInsets.only(
                top: textPadding ?? 20.h, bottom: 7.h, left: 25.w, right: 25.w),
            child: CommonTextStleWidget(
              title: title,
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).blueShadeColor,
              textAlign: TextAlign.center,
            ),
          ),
          //subtitle Text
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w),
            child: CommonTextStleWidget(
              textAlign: TextAlign.center,
              title: subTitle,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: CustomColor.lightBlueShadeColor,
            ),
          ),
          //button
          Padding(
            padding: EdgeInsets.only(
                top: 25.0.h, left: 20.w, right: 20.w, bottom: 25.h),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      MyFunction.backFromScreen(context);
                    },
                    child: Container(
                      height: 45.h,
                      width: 131.w,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(0.5.sp),
                      decoration: BoxDecoration(
                        boxShadow: [
                          MyFunction.getBoxShadow(
                            dx: 0,
                            dy: 0,
                            blurRadius: 15,
                            spreadRadius: 0,
                            color: CustomColor.shadowColor.withOpacity(0.1),
                            blurStyle: BlurStyle.outer,
                          )
                        ],
                        border: Border.all(
                          width: 2.w,
                          color:
                              CustomColor.linearPrimaryColor.withOpacity(0.8),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                      child: CommonTextWidget(
                        title: "cancelText".tr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.linearSecondaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      MyFunction.backFromScreen(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                        gradient: MyFunction.selectedGradBackGround(),
                        boxShadow: [
                          MyFunction.getBoxShadow(
                            dx: 0,
                            dy: 4,
                            blurRadius: 15,
                            spreadRadius: 0,
                            color: CustomColor.shadowColor.withOpacity(0.1),
                          )
                        ],
                      ),
                      child: CommonTextWidget(
                        title: "yesText".tr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
