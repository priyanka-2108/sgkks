import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/information/components/custom_display_row_widget.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/common_text.dart';

class BrifInformationBody extends StatelessWidget {
  const BrifInformationBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonProfileFace(
            isBorder: false, image: AssetString.onboardingAsset, radius: 24.r),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(
                  title: "Jacob Jones",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color:  Theme.of(context).lightBlueTextColor,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                //?people detail & age detail
                CustomDisplayRowWidget(
                  fistAsset: AssetString.peopleIcon,
                  fistTitle: "brotherText".tr,
                  secondAsset: AssetString.cakeIcon,
                  secondTitle: '24',
                )
              ],
            ),
          ),
        ),
        // //?edit icon
        Image.asset(AssetString.editIcon),
        SizedBox(
          width: 8.w,
        ),
        // //?delete icon
        Image.asset(AssetString.deleteIcon)
      ],
    );
  }
}
