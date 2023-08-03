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
  final String? village;
  final String? address;
  final String? state;
  final String? city;
  final bool? isEdit;

  const ResidentialInformationWidget(
      {super.key, this.village, this.address, this.state, this.city,  this.isEdit,
     });


  @override
  State<ResidentialInformationWidget> createState() =>
      _ResidentialInformationWidgetState();
}

class _ResidentialInformationWidgetState
    extends State<ResidentialInformationWidget> {
  TextEditingController? villageEditingController;
  TextEditingController? addressEditingController;
  TextEditingController? stateEditingController;
  TextEditingController? cityEditingController;


  final List<String> cityItems = [
    'Surat',
    'Ahmadabad',
    'Maharashtra',
    'Andaman  and Nicobar Islands',
    'Rajkot',
    'Vadodara'
  ];
  @override
  void initState() {
    villageEditingController = TextEditingController(text: widget.village);
    addressEditingController = TextEditingController(text: widget.address);
    stateEditingController = TextEditingController(text: widget.state);
    cityEditingController = TextEditingController(text: widget.city);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top:widget.isEdit == true
              ? 15.h
              : 30.h + SizeConstant.hightToSkipBackButtonInTabView,bottom:widget.isEdit == true ? 0.h :52.h),
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
          Flexible(child: ListView(children: [
            //?city field
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: CustomTextFieldWidget(
                labelText: "villageText".tr,
                hintText: "enterVillegeText".tr,
                isPreFixIcon:true,
                isSvgIcon:true,
                asset: AssetString.locationIconSvg,
                // asset: AssetString.locationIcon,
                textEditingController: villageEditingController!,color:Theme.of(context).titleTextColor ,),
            ),
            //?address field
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: CustomTextFieldWidget(
                labelText: "addressText".tr,
                hintText: "enterAddressText".tr,
                // asset: AssetString.locationIcon,
                isPreFixIcon:true,
                isSvgIcon:true,
                asset: AssetString.locationIconSvg,
                textEditingController: addressEditingController!,color:Theme.of(context).titleTextColor ,),
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
                          cityEditingController?.clear();
                        }
                      },
                      text: widget.city == null
                          ? "cityText".tr
                          : widget.city as String,
                      width: ((MyFunction.getWidth(context) - 58.w) / 2),
                      isSearch: true,
                      type: 'residential',
                      menuHeight: 35.h,
                      color:Theme.of(context).titleTextColor,),
                  ),
                  //?state field
      CommonDropDown(
        labelText: "stateText".tr,
        items: cityItems,
        menuStateChange: (isOpen) {
          if (!isOpen) {
            stateEditingController?.clear();
          }
        },
        text: widget.state == null
            ? "stateText".tr
            : widget.state as String,
        width: ((MyFunction.getWidth(context) - 58.w) / 2),
        isSearch: true,
        type: 'residential',
        menuHeight: 35.h,
        color:Theme.of(context).titleTextColor,),

                  // CustomTextFieldWidget(
                  //   width: ((MyFunction.getWidth(context) - 58.w) / 2),
                  //   isPreFixIcon: false,
                  //   labelText: "stateText".tr,
                  //   hintText: "stateText".tr,
                  //   isSvgIcon:true,
                  //   asset: AssetString.locationIconSvg,
                  //   // asset: AssetString.locationIcon,
                  //   textEditingController: stateEditingController!,color:Theme.of(context).titleTextColor ,),
                ],
              ),
            )
          ],))

        ],
      ),
    );
  }
}
