import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/widget/common_button.dart';
import '../../utils/asset_string.dart';
import '../../utils/my_function.dart';
import '../../utils/my_string.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_dropdown.dart';
import '../../widget/common_text.dart';
import '../../widget/custom_dropdown.dart';
import '../../widget/custom_radio_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final TextEditingController villageEditingController =
      TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  FocusNode textFieldFocusNode = FocusNode();

  final List<String> cityItems = [
    'Surat',
    'Ahmadabad',
    'Maharashtra',
    'Andaman  and Nicobar Islands',
  ];
  final List<String> villageItems = [
    'Surat',
    'Ahmadabad',
    'Maharashtra',
    'Andaman  and Nicobar Islands',
  ];
  final List<String> stateItems = [
    'Surat',
    'Ahmadabad',
    'Maharashtra',
    'Andaman  and Nicobar Islands',
  ];
  String? selectedValue;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MyFunction.getHight(context),
          width: MyFunction.getWidth(context),
          decoration:
              MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
          child: Padding(
            padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 35.h),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        //?filter information text
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: CommonTextWidget(
                              title: "filterText".tr,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        //?back button
                        CommonBackButton(color:Theme.of(context).backIconColor,
                          boxShadow:(ThemeManager.instance.themeMode == ThemeMode.light)
                              ?[MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.1),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            dx: 0.0, dy : 4.0,),] :  [MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.31),
                            blurRadius: 26.0,
                            spreadRadius: 0.0,
                            dx: 0.0, dy : 1.0,),],),
                      ],
                    ),

                    //?village Dropdown
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: CommonDropDown(
                        labelText: "villageText".tr,
                        controller: searchController,
                        items: villageItems,
                        menuStateChange: (isOpen) {
                          if (!isOpen) {
                            searchController.clear();
                          }
                        },
                        text: "selectVillageText".tr,
                      ),
                      // CustomDropDownWidget(
                      //   labelText: "villageText".tr,
                      //   title: "selectVillageText".tr,
                      //   height: 45.h,
                      // ),
                    ),
                    //?city Dropdown
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: CommonDropDown(
                        labelText: "cityText".tr,
                        controller: searchController,
                        items: cityItems,
                        menuStateChange: (isOpen) {
                          if (!isOpen) {
                            searchController.clear();
                          }
                        },
                        text: "selectCityText".tr,
                      ),
                      // CustomDropDownWidget(
                      //   labelText: "cityText".tr,
                      //   title: "selectCityText".tr,
                      //   height: 45.h,
                      // ),
                    ),
                    //?state Dropdown
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: CommonDropDown(
                        labelText: "stateText".tr,
                        controller: searchController,
                        items: stateItems,
                        menuStateChange: (isOpen) {
                          if (!isOpen) {
                            searchController.clear();
                          }
                        },
                        text: "selectStateText".tr,
                      ),
                      // CustomDropDownWidget(
                      //   labelText: "stateText".tr,
                      //   title: "selectStateText".tr,
                      //   height: 45.h,
                      // ),
                    ),
                    //?gender selection
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Row(
                        children: [
                          CustomRadioButton(
                            rightPadding: 14.w,
                            width: (MyFunction.getWidth(context) - 15.h) / 3,
                            isSvgIcon: true,
                            labelText: "genderText".tr,
                            title: "maleText".tr,
                            asset: AssetString.maleIcon,
                            textEditingController: addressEditingController,
                            isBoxSelected: true,
                            onTap: () {},
                          ),
                          SizedBox(
                            width: 15.h,
                          ),
                          CustomRadioButton(
                            rightPadding: 14.w,
                            width: (MyFunction.getWidth(context) - 15.h) / 3,
                            isSvgIcon: true,
                            labelText: "",
                            title: "femaleText".tr,
                            asset: AssetString.femaleIcon,
                            textEditingController: addressEditingController,
                            isBoxSelected: false,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // add button
                Positioned(
                  bottom: 0.h,
                  left: 28.w,
                  right: 28.w,
                  child: GestureDetector(
                    child: CommonButton(title: "addText".tr, onTap: () {}),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
