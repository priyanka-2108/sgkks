import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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

import '../../../bottomSheet/my_bottom_sheet.dart';
import '../../../datePicker/date_picker.dart';
import '../../../utils/my_enum.dart';
import '../../../widget/common_dropdown.dart';

class SignUpWidget extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? fatherName;
  final String? dateOfBirth;
  final String? maleGender;
  final String? femaleGender;
  final String? email;
  final String? qualification;
  final bool? isEdit;
  final String? image;

  const SignUpWidget({
    super.key,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.dateOfBirth,
    this.maleGender,
    this.femaleGender,
    this.email,
    this.qualification,
    this.isEdit,
    this.image,
  });

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? fatherNameController;
  TextEditingController? dateOfBirthController;
  TextEditingController? maleGenderController;
  TextEditingController? femaleGenderController;
  TextEditingController? emailController;
  TextEditingController? qualificationController;
  static List<String> qualificationItems = [
    '10PassText'.tr,
    '12PassText'.tr,
    'graduateText'.tr,
    'postGraduateText'.tr,
  ];
  Gender gender = Gender.male;
  DateTime selectedDate = DateTime.now();
  static bool isCheck = false;
  @override
  void initState() {
    print("widget.firstName-->${widget.firstName}");
    firstNameController = TextEditingController(text: widget.firstName);
    lastNameController = TextEditingController(text: widget.lastName);
    fatherNameController = TextEditingController(text: widget.fatherName);
    dateOfBirthController = TextEditingController(text: widget.dateOfBirth);
    maleGenderController = TextEditingController(text: widget.maleGender);
    femaleGenderController = TextEditingController(text: widget.femaleGender);
    emailController = TextEditingController(text: widget.email);
    qualificationController = TextEditingController(text: widget.qualification);
    super.initState();
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(2015, 8),
  //       lastDate: DateTime(2101));
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //
  //       selectedDate = picked;
  //
  //        inputDate =DateFormat('dd-MM-yyyy').format(selectedDate);
  //
  //
  //       print("inputDate-->$inputDate");
  //
  //
  //     });
  //
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.isEdit == true
              ? 15.h
              : 15,
          // 30.h + SizeConstant.hightToSkipBackButtonInTabView,
          bottom: widget.isEdit == true ? 0.h : 0
          // 52.h
          ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isEdit != true) ...[
              //?sign up text
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 8.h),

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
                padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 22.h),

                child: Center(
                  child: CommonTextWidget(
                      color: CustomColor.greyColor,
                      title: "createAccountMess".tr,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],

            //?profile pic
            Padding(
              padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 24.h),

              child: GestureDetector(
                onTap: () {
                  MyBottomSheet.imageUploadBottomSheet(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: MyFunction.getGradColor(),
                    border: Border.all(
                        color: ThemeManager.instance.themeMode == ThemeMode.light
                            ? Theme.of(context).customPrimaryColor
                            : CustomColor.whiteColor,
                        width: widget.image != null ? 0 : 3.sp),
                    shape: BoxShape.circle,
                  ),
                  child: CommonProfileFace(
                    radius: 50.r,
                    isBorder: widget.image != null ? false : true,
                    image: widget.image != null
                        ? AssetString.userDetail1
                        : AssetString.cameraWithOutIcon,
                    child: widget.image != null
                        ? null
                        : Lottie.asset(
                            AssetString.cameraIconJson,
                          ),
                    // Image.asset(
                    //   AssetString.cameraWithOutIcon,
                    //   color: ThemeManager.instance.themeMode == ThemeMode.light
                    //       ? Theme.of(context).customPrimaryColor
                    //       : CustomColor.whiteColor,
                    // ),
                  ),
                ),
              ),
            ),
            Padding( padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 20.h),

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
                      isPreFixIcon:true,
                      isSvgIcon:true,
                      asset: AssetString.userIconSvg,
                      // asset: AssetString.userIcon,
                      textEditingController: firstNameController!,
                      color: Theme.of(context).titleTextColor,
                    ),
                  ),
                  //?last name
                  CustomTextFieldWidget(
                    width: ((MyFunction.getWidth(context) - 58.w) / 2),
                    labelText: "lastNameText".tr,
                    hintText: "lastNameText".tr,
                    // asset: AssetString.userIcon,
                    isPreFixIcon:true,
                    isSvgIcon:true,
                    asset: AssetString.userIconSvg,
                    textEditingController: lastNameController!,
                    color: Theme.of(context).titleTextColor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 20.h),

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
                      // asset: AssetString.userIcon,
                      isPreFixIcon:true,
                      isSvgIcon:true,
                      asset: AssetString.userIconSvg,
                      textEditingController: fatherNameController!,
                      color: Theme.of(context).titleTextColor,
                    ),
                  ),
                  //?date of birth
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 13.h),
                        child: CommonTextWidget(
                          title: "birthDateText".tr,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).titleTextColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => DatePicker.selectDate(context),
                        child: Container(
                          height: 45.h,
                          width: ((MyFunction.getWidth(context) - 58.w) / 2),
                          padding: EdgeInsets.all(0.5.sp),
                          decoration: BoxDecoration(
                            color: Theme.of(context).customPrimaryColor,
                            boxShadow: [
                              MyFunction.getBoxShadow(
                                  spreadRadius: 0,
                                  blurRadius: 15.sp,
                                  color:
                                      CustomColor.shadowColor.withOpacity(0.1),
                                  blurStyle: BlurStyle.outer

                                  // dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0,
                                  )
                            ],
                            border: Border.all(
                                color: CustomColor.linearSecondaryColor
                                    .withOpacity(0.2)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.sp)),
                          ),
                          child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 0.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  SvgPicture.asset(AssetString.cakeIconSvg),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 8.w, right: 8.w),
                                      child: Obx(
                                        () => Text(datePickerData.inputDate.value == "" ?
                                        "birthDateText".tr : datePickerData.inputDate.value,

                                          style: TextStyle(
                                            color: CustomColor.greyColor,
                                            fontSize: 14.0.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  // GestureDetector(onTap: ()=>_selectDate(context),
                  //   child: CustomTextFieldWidget(
                  //     width: ((MyFunction.getWidth(context) - 58.w) / 2),
                  //     labelText: "dateOfBirthText".tr,
                  //     hintText: "ageText".tr,
                  //     asset: AssetString.cakeIcon,
                  //     textEditingController: dateOfBirthController!,
                  //     color: Theme.of(context).titleTextColor,
                  //   ),
                  // ),
                ],
              ),
            ),
            //?gender selection
            Padding(
                padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 20.h),

                child: Row(
                  children: [
                    CustomRadioButton(
                      rightPadding: 14.w,
                      width: (MyFunction.getWidth(context) - 15.h) / 3,
                      isSvgIcon: true,
                      labelText: "genderText".tr,
                      title: "maleText".tr,
                      asset: AssetString.maleIcon,
                      textEditingController: maleGenderController!,
                      isBoxSelected: (gender == Gender.male),
                      onTap: () {
                        gender = Gender.male;
                        setState(() {});
                      },
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
                      textEditingController: femaleGenderController!,
                      isBoxSelected: (gender == Gender.female),
                      onTap: () {
                        gender = Gender.female;
                        setState(() {});
                      },
                      color: Theme.of(context).titleTextColor,
                    ),
                  ],
                )),
            //?email field
            Padding(
              padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 20.h),

              child: CustomTextFieldWidget(
                labelText: "emailAddressText".tr,
                hintText: "enterEmailText".tr,
                asset: AssetString.emailIcon,
                isSvgIcon: true,
                textEditingController: emailController!,
                color: Theme.of(context).titleTextColor,
              ),
            ),
            //?qualification field
            Padding(
              padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 5.h),

              child: CommonDropDown(
                labelText: "qualificationText".tr,
                items: qualificationItems,
                menuStateChange: (isOpen) {
                  if (!isOpen) {
                    qualificationController?.clear();
                  }
                },
                text: widget.qualification == null
                    ? "selectQualificationText".tr
                    : widget.qualification as String,
                isSearch: true,
                type: 'qualification',
                menuHeight: 35.h,
                color: Theme.of(context).titleTextColor,
              ),
            ),
           if(widget.isEdit != true)
            Padding(

              padding: EdgeInsets.only(left: 12.w, right: 22.w,bottom: 20),
              child: Row(
                children: [
                  Checkbox(
                      activeColor: CustomColor.linearPrimaryColor,
                      value: isCheck,
                      onChanged: (value) {
                        isCheck = value!;
                        setState(() {});
                      }),
                  Flexible(
                    child: CommonTextStleWidget(
                      title: "privacyAndPolicyText".tr,
                      letterSpacing: 0.5,
                      height: 1.5.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
