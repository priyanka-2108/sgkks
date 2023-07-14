import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/dotted_border_widget.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 13.h),
          child: CommonTextWidget(
              title: labelText, fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        Stack(
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
                      gradient: (ThemeManager.instance.themeMode == ThemeMode.light
                          ? null
                          : MyFunction.getGradColor()),
                    ),
                    child: CircleAvatar(
                      radius: 29.r,
                      backgroundColor:
                          CustomColor.linearSecondaryColor.withOpacity(0.3),
                      child: Image.asset(Theme.of(context).cameraIcon),
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  CommonTextWidget(
                      title: "addPhotoText".tr, fontSize: 12.sp, fontWeight: FontWeight.w400,color: Theme.of(context).lightBlueTextColor,)
                ],
              ),

            ),
          ],
        ),
      ],
    );
  }
}
