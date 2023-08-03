import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sgkks/bottomSheet/my_bottom_sheet.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';

import '../bottomSheet/components/common_bottom_app_bar.dart';
import '../utils/my_function.dart';
import '../utils/theme/theme_manager.dart';
import '../widget/common_button.dart';
import '../widget/common_text.dart';
import '../widget/custom_divider.dart';
import '../widget/dotted_border_widget.dart';

class MyDialogBox {
  static ImageUploadDialogBox(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).bottomNavigationBarColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.sp),
      ),
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CommonTextWidget(
                    title: "addImageText".tr,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).blackColor,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 8.w,
                ),
                // width: double.infinity,
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
            ],
          ),

          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: CustomDivider(topPadding: 10.h,bottomPadding: 12.h,),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w,bottom: 12.h),
              child: CommonTextWidget(
                title: "maximumText".tr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: CustomColor.greyColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w,),
            child: GestureDetector(
              onTap: (){

                MyBottomSheet.imageUploadBottomSheet(context);
              },
              child: Stack(
                children: [
                  const DottedBoaderWidget(
                    color: CustomColor.linearSecondaryColor,
                    dashPattern: [8, 4, 8, 4],
                  ),
                  const DottedBoaderWidget(),
                  //center of 130 container
                  Positioned(
                    top: (65.h - 29.r),
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: (ThemeManager.instance.themeMode ==
                                    ThemeMode.light
                                ? null
                                : MyFunction.getGradColor()),
                          ),
                          child: CircleAvatar(
                            radius: 29.r,
                            backgroundColor:
                                CustomColor.linearSecondaryColor.withOpacity(0.3),
                            child: SvgPicture.asset(Theme.of(context).cameraIcon),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CommonTextWidget(
                          title: "addPhotoText".tr,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).lightBlueTextColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: CustomDivider(topPadding: 20.h),
          ),
          //add button
          Padding(
            padding: EdgeInsets.only(
                left: 25.w, right: 25.w, bottom: 20.h, top: 15.h),
            child: CommonButton(title: "uploadImageText".tr, onTap: () { MyFunction.backFromScreen(context);}),
          ),

        ],
      ),
    );
  }
}
