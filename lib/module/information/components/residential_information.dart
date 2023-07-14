import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/custom_divider.dart';
import 'package:sgkks/widget/custom_text_field_widget.dart';

import '../../../widget/common_dropdown.dart';

class ResidentialInformationWidget extends StatefulWidget {
  const ResidentialInformationWidget(
      {super.key,
      required this.villageEditingController,
      required this.addressEditingController});
  final TextEditingController villageEditingController;
  final TextEditingController addressEditingController;

  @override
  State<ResidentialInformationWidget> createState() =>
      _ResidentialInformationWidgetState();
}

class _ResidentialInformationWidgetState
    extends State<ResidentialInformationWidget> {
  final List<String> cityItems = [
    'Surat',
    'Ahmadabad',
    'Maharashtra',
    'Andaman  and Nicobar Islands',
    'Rajkot',
    'Vadodara'
  ];
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
            //?residential information text
            CommonTextWidget(
              title: "residentialInformationText".tr,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            //?divider
            const CustomDivider(),
            //?city field
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: CustomTextFieldWidget(
                  labelText: "villageText".tr,
                  hintText: "suratText".tr,
                  asset: AssetString.locationIcon,
                  textEditingController: widget.villageEditingController,color:Theme.of(context).titleTextColor ,),
            ),
            //?address field
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: CustomTextFieldWidget(
                  labelText: "addressText".tr,
                  hintText: "enterAddressText".tr,
                  asset: AssetString.locationIcon,
                  textEditingController: widget.addressEditingController,color:Theme.of(context).titleTextColor ,),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Row(
                children: [
                  //minus hight is 44.w + 14.w
                  //?city Dropdown
                  Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: CommonDropDown(
                        labelText: "cityText".tr,
                        items: cityItems,
                        menuStateChange: (isOpen) {
                          if (!isOpen) {
                            widget.addressEditingController.clear();
                          }
                        },
                        text: "cityText".tr,
                        width: ((MyFunction.getWidth(context) - 58.w) / 2),
                        isSearch: true,
                        type: 'residential',
                        menuHeight: 35.h,
                      color:Theme.of(context).titleTextColor,),
                  ),
                  //?state field
                  CustomTextFieldWidget(
                      width: ((MyFunction.getWidth(context) - 58.w) / 2),
                      isPreFixIcon: false,
                      labelText: "stateText".tr,
                      hintText: "gujaratText".tr,
                      asset: AssetString.locationIcon,
                      textEditingController: widget.addressEditingController,color:Theme.of(context).titleTextColor ,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
