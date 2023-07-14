import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/custom_radio_button.dart';
import 'package:sgkks/widget/custom_text_field_widget.dart';

import '../../../widget/common_dropdown.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController maleGenderController = TextEditingController();
  final TextEditingController femaleGenderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  static List<String> qualificationItems = [
    '10th Pass',
    '12th Pass',
    'Graduate',
    'Post Graduate',
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
            //?sign up text
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Center(
                child: CommonTextWidget(
                  title: "signUpCamelCaseText".tr,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            //?create account message
            Padding(
              padding: EdgeInsets.only(bottom: 22.h),
              child: Center(
                child: CommonTextWidget(
                    color: CustomColor.greyColor,
                    title: "createAccountMess".tr,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
            //?profile pic
            Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Container(
                decoration: BoxDecoration(
                  gradient: MyFunction.getGradColor(),
                  border: Border.all(
                      color: ThemeManager.instance.themeMode == ThemeMode.light
                          ? Theme.of(context).customPrimaryColor
                          : CustomColor.whiteColor,
                      width: 3.sp),
                  shape: BoxShape.circle,
                ),
                child: CommonProfileFace(
                  radius: 50.r,
                  isBorder: true,
                  image: AssetString.cameraWithOutIcon,
                  child: Image.asset(
                    AssetString.cameraWithOutIcon,
                    color: ThemeManager.instance.themeMode == ThemeMode.light
                        ? Theme.of(context).customPrimaryColor
                        : CustomColor.whiteColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Row(
                children: [
                  //minus hight is 44.w + 14.w
                  //?first name
                  Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: CustomTextFieldWidget(
                        width: ((MyFunction.getWidth(context) - 58.w) / 2),
                        labelText: "firstNameText".tr,
                        hintText: "firstNameText".tr,
                        asset: AssetString.userIcon,
                        textEditingController: firstNameController,color:Theme.of(context).titleTextColor,),
                  ),
                  //?last name
                  CustomTextFieldWidget(
                      width: ((MyFunction.getWidth(context) - 58.w) / 2),
                      labelText: "lastNameText".tr,
                      hintText: "lastNameText".tr,
                      asset: AssetString.userIcon,
                      textEditingController: lastNameController,color: Theme.of(context).titleTextColor,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Row(
                children: [
                  //minus hight is 44.w + 14.w
                  //?father name
                  Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: CustomTextFieldWidget(
                        width: ((MyFunction.getWidth(context) - 58.w) / 2),
                        labelText: "fatherNameText".tr,
                        hintText: "fatherNameText".tr,
                        asset: AssetString.userIcon,
                        textEditingController: fatherNameController,color:Theme.of(context).titleTextColor,),
                  ),
                  //?date of birth
                  CustomTextFieldWidget(
                      width: ((MyFunction.getWidth(context) - 58.w) / 2),
                      labelText: "dateOfBirthText".tr,
                      hintText: "ageText".tr,
                      asset: AssetString.cakeIcon,
                      textEditingController: dateOfBirthController,color:Theme.of(context).titleTextColor,),
                ],
              ),
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
                      textEditingController: maleGenderController,
                      isBoxSelected: true,
                      onTap: () {},
                      color: Theme.of(context).titleTextColor,
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
                      textEditingController: femaleGenderController,
                      isBoxSelected: false,
                      onTap: () {},
                      color:Theme.of(context).titleTextColor,
                    ),
                  ],
                )),
            //?email field
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: CustomTextFieldWidget(
                  labelText: "emailAddressText".tr,
                  hintText: "enterEmailText".tr,
                  asset: AssetString.emailIcon,
                  isSvgIcon: true,
                  textEditingController: emailController,color: Theme.of(context).titleTextColor,),
            ),
            //?qualification field
            Padding(
              padding: EdgeInsets.only(bottom: 30.h),
              child: CommonDropDown(
                labelText: "qualificationText".tr,
                items: qualificationItems,
                menuStateChange: (isOpen) {
                  if (!isOpen) {
                    qualificationController.clear();
                  }
                },
                text: "selectQualificationText".tr,
                isSearch: true,
                type: 'qualification',
                menuHeight: 35.h,
                color: Theme.of(context).titleTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
