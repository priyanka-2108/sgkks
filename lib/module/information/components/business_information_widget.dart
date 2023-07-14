import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/custom_add_photo_widget.dart';
import 'package:sgkks/widget/custom_divider.dart';
import 'package:sgkks/widget/custom_dropdown.dart';
import 'package:sgkks/widget/custom_image_view.dart';
import 'package:sgkks/widget/cutom_long_text_field.dart';

import '../../../widget/custome_add_image.dart';

class BusinessInformationWidget extends StatelessWidget {
  const BusinessInformationWidget(
      {super.key,
      required this.villageEditingController,
      required this.addressEditingController});
  final TextEditingController villageEditingController;
  final TextEditingController addressEditingController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 30.h + SizeConstant.hightToSkipBackButtonInTabView),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //?business information text
            CommonTextWidget(
              title: "businessInformationText".tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            //?divider
            const CustomDivider(),
            //?visiting card image view
            CustomImageView(
              labelText: "addVisitingCardText".tr,
            ),
            //?add other businessCard
            Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                child: CustomAddPhotoWidget(
                  title: "addOtherBusinessImageText".tr,
                  color:Theme.of(context).blackColor,
                )),
            //image
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Row(
                children: [
                  CustomAddImage(
                    image: AssetString.addImage1,
                  ),
                  CustomAddImage(
                    image: AssetString.addImage2,
                  ),
                ],
              ),
            ),

            //?suggestion widget
            customLongTextField(
              hintText: "writeADetailedSuggestionText".tr,
              labelText: "suggestionText".tr,
              color:Theme.of(context).titleTextColor ,
            ),
            //?select occupation
            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
              child: CustomDropDownWidget(
                labelText: "addOccupationText".tr,
                title: "selectOccupationText".tr,
                color:Theme.of(context).titleTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
