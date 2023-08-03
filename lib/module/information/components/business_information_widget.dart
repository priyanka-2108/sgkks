import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
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

import '../../../bottomSheet/my_bottom_sheet.dart';
import '../../../dialogBox/my_dialog_box.dart';
import '../../../widget/common_dropdown.dart';
import '../../../widget/custome_add_image.dart';

class BusinessInformationWidget extends StatefulWidget {
  final TextEditingController? villageEditingController;
  final TextEditingController? addressEditingController;
  final bool? isEdit;
  const BusinessInformationWidget(
      {super.key,
      this.villageEditingController,
      this.addressEditingController,
      this.isEdit});

  @override
  State<BusinessInformationWidget> createState() =>
      _BusinessInformationWidgetState();
}

class _BusinessInformationWidgetState extends State<BusinessInformationWidget> {
  final TextEditingController? qualifiactionEditingController =
      TextEditingController();
  bool? isSelect;
  final List imageList = [
    AssetString.addImage1,
    AssetString.addImage2,
    AssetString.userDetail2,
    AssetString.peopleIcon,
  ];
  static List<String> qualificationItems = [
    'Doctor',
    'Engineer',
    'Lawyer',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.isEdit == true
              ? 15.h
              : 30.h + SizeConstant.hightToSkipBackButtonInTabView,
          bottom:widget.isEdit == true ? 0.h : 52.h),
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
            CustomDivider(bottomPadding: widget.isEdit == true ? 10.h : 20.h),
            Flexible(
              child: ListView(children: [
                if (widget.isEdit == true) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonTextWidget(
                        title: "ownBusinessText".tr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          trackColor:
                              CustomColor.linearSecondaryColor.withOpacity(0.3),
                          activeColor:
                              CustomColor.linearSecondaryColor.withOpacity(0.3),
                          thumbColor: CustomColor.linearSecondaryColor,
                          value: isSelect ?? false,
                          onChanged: (value) async {
                            setState(() {
                              isSelect = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
                if (isSelect == true || widget.isEdit == false) ...[
                  GestureDetector(
                    onTap: () {
                      MyBottomSheet.imageUploadBottomSheet(context);
                    },
                    child: CustomImageView(
                      labelText: "addVisitingCardText".tr,
                    ),
                  ),
                  //?add other businessCard
                  Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                      child: CustomAddPhotoWidget(
                        title: "addOtherBusinessImageText".tr,
                        color: Theme.of(context).blackColor,
                        onTap: () {
                          print("image");
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  MyDialogBox.ImageUploadDialogBox(context));
                        },
                      )),
                  //image

                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Row(
                      children: imageList.map((value) {
                        return CustomAddImage(
                          image: value,
                          onTap: () {
                            setState(() {
                              imageList.removeAt(imageList.indexOf(value));
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),

                  //?suggestion widget
                  customLongTextField(
                    hintText: "writeADetailedSuggestionText".tr,
                    labelText: "suggestionText".tr,
                    color: Theme.of(context).titleTextColor,
                  ),
                  //?select occupation
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                    child: CommonDropDown(
                      labelText: "addOccupationText".tr,
                      items: qualificationItems,
                      menuStateChange: (isOpen) {
                        if (!isOpen) {
                          qualifiactionEditingController?.clear();
                        }
                      },
                      text: "selectOccupationText".tr,
                      isSearch: true,
                      type: 'qualification',
                      menuHeight: 35.h,
                    ),
                    // CustomDropDownWidget(
                    //   labelText: "addOccupationText".tr,
                    //   title: "selectOccupationText".tr,
                    //   color:Theme.of(context).titleTextColor,
                    // ),
                  ),
                ],
              ]),
            ),
          ]),
    );
  }
}
