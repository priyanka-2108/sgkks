import 'dart:convert';
import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sgkks/bottomSheet/components/common_bottom_app_bar.dart';
import 'package:sgkks/bottomSheet/components/common_long_check_box_button.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_enum.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';
import 'package:sgkks/widget/common_button.dart';
import 'package:sgkks/widget/custom_listview_with_card_widget.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/custom_divider.dart';
import 'package:sgkks/widget/custom_radio_button.dart';
import 'package:sgkks/widget/custom_text_field_widget.dart';
import '../controller/language_controller.dart';
import '../datePicker/date_picker.dart';
import '../localString/update_language.dart';
import '../shared_preference/shared_preference.dart';
import '../widget/common_dropdown.dart';
import '../widget/common_no_data_found.dart';
import '../widget/dotted_border_widget.dart';

final LanguageController languageData = Get.put(LanguageController());

class MyBottomSheet {
  static List<String> relationItems = [
    'brotherGujText'.tr,
    'sisterGujText'.tr,
  ];
  static List<String> qualificationItems = [
    '10PassText'.tr,
    '12PassText'.tr,
    'graduateText'.tr,
    'postGraduateText'.tr,
  ];
  static List<String> reasonForItems = [
    'offensiveText'.tr,
    'spamText'.tr,
    'harassmentText'.tr,
    'intellectualText'.tr,
    'impersonationText'.tr,
    'misinformationText'.tr,
    'violationText'.tr,
  ];
  static String? selectedValue;
  static bool isMenuOpen = false;
  static bool isCheck = false;

  static selectLanguageBottomSheet(BuildContext context, route,
      [bool? isSelect]) {
    showModalBottomSheet(
      context: context,
      // isDismissible: ,
      isDismissible: false,
      isScrollControlled: true,
      shape: MyFunction.getRoundedRectangleBorder(),
      elevation: 0,
      // barrierColor: CustomColor.transparent,
      backgroundColor: Theme.of(context).bottomNavigationBarColor,
      builder: (context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 50.h),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32.h),
                  child: CommonBottomSheetAppBar(
                      title: isSelect == true
                          ? "changeLanguageText".tr
                          : "selectLanguageTitle".tr),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: languageData.languageList.length,
                  padding: EdgeInsets.only(bottom: 20.h),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: InkWell(
                        onTap: () {
                          // if (selectedLanguageList
                          //     .contains(languageList[index])) {
                          //   selectedLanguageList = [];
                          // } else {
                          //   selectedLanguageList = [];
                          //   selectedLanguageList.add(languageList[index]);
                          // }

                          languageData.selectedLanguage.value =
                              languageData.languageList[index];

                          languageData.localeIndex.value = languageData
                              .languageList
                              .indexOf(languageData.selectedLanguage.value);
                        },
                        child: Obx(
                          () => CommonLongCheckBoxButton(
                            title: languageData.languageList[index],
                            isLanguageSelected: languageData.languageList[index]
                                .contains(
                                    languageData.selectedLanguage.value.tr),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: CommonButton(
                    title: "doneLangText".tr,
                    onTap: () async {
                      languageData.localeIndex.value = languageData.languageList
                          .indexOf(languageData.selectedLanguage.value);

                      await UpdateLang.updateLanguage(
                        UpdateLang.locale[languageData.localeIndex.value]
                            ['locale'],
                        true,
                      );

                      Map<String, dynamic> jsonString = {
                        "name":
                            "${UpdateLang.locale[languageData.localeIndex.value]['name']}",
                        "locale":
                            "${UpdateLang.locale[languageData.localeIndex.value]['locale']}",
                        "key":
                            "${UpdateLang.locale[languageData.localeIndex.value]['key']}"
                      };

                      print("jsonString---->${jsonString}");

                      await MySharedPreference.prefs.setString(
                          'localeTranslationStore', jsonEncode(jsonString));

                      // route;
                      if (context.mounted) {
                        if (route == "setting") {
                          print("cliclclclc");
// Navigator.of(context).pop(false);
//                           MyFunction.backFromScreen(context);
                          // MyFunction.replaceScreen(context, "/setting" );
                        } else {
                          MyFunction()
                              .replaceScreenAfter(context, "/onboarding");
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  static addDetailBottomSheet(
      BuildContext context,
      VoidCallback onTap,
      UserStatus userStatus,
      TextEditingController? firstNameEditingController,
      TextEditingController? dateOfBirthEditingController,
      TextEditingController? relationEditingController,
      TextEditingController? maleEditingController,
      TextEditingController? femaleEditingController,
      TextEditingController? qualificationEditingController,
      String? image) {
    TextEditingController addressEditingController = TextEditingController();
    Gender gender = Gender.male;
    showModalBottomSheet(
      context: context,
      // isDismissible: ,
      isDismissible: true,
      isScrollControlled: true,
      shape: MyFunction.getRoundedRectangleBorder(),
      elevation: 15,

      // barrierColor: CustomColor.transparent,
      backgroundColor: Theme.of(context).bottomNavigationBarColor,

      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return SizedBox(
            // height: 580.h,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 22.h, 0, 0),
                child: Wrap(
                  children: [
                    //?appBar
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                      child: CommonBottomSheetAppBar(
                          title: userStatus == UserStatus.single
                              ? "addYourSiblingsDetailsText".tr
                              : userStatus == UserStatus.married
                                  ? "addYourWifeDetailsText".tr
                                  : userStatus == UserStatus.withKids
                                      ? "addYourKidsDetailsText".tr
                                      : "addYourSiblingsDetailsText".tr),
                    ),
                    CustomDivider(topPadding: 13.h),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 20.h, left: 20.w, right: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          MyBottomSheet.imageUploadBottomSheet(context);
                        },
                        child: Center(
                            child: Container(
                          width: 90.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (ThemeManager.instance.themeMode ==
                                      ThemeMode.light)
                                  ? CustomColor.greyColor
                                  : null,
                              border: Border.all(
                                  color: CustomColor.whiteColor,
                                  width: image != "" ? 0 : 3.w),
                              gradient: (ThemeManager.instance.themeMode ==
                                      ThemeMode.light)
                                  ? null
                                  : MyFunction.selectedGradBackGround()),
                          child: image != ""
                              ? ClipOval(child: Image.asset(image!))
                              : Lottie.asset(
                                  AssetString.cameraIconJson,
                                ),
                          // Image.asset(AssetString.cameraWithOutIcon),
                        )
                            //     CircleAvatar(
                            //
                            //       backgroundColor: CustomColor.greyColor,
                            //       radius: 50.r,
                            //       child: Image.asset(AssetString.cameraWithOutIcon),
                            //     ),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 20.h, left: 20.w, right: 20.w),
                      child: Row(
                        children: [
                          //minus hight is 44.w + 14.w
                          //?first name
                          Padding(
                            padding: EdgeInsets.only(right: 14.w),
                            child: CustomTextFieldWidget(
                                width:
                                    ((MyFunction.getWidth(context) - 58.w) / 2),
                                labelText: "nameText".tr,
                                hintText: "firstNameText".tr,
                                isPreFixIcon: true,
                                isSvgIcon: true,
                                asset: AssetString.userIconSvg,
                                // asset: AssetString.userIcon,
                                textEditingController:
                                    firstNameEditingController!),
                          ),
                          //?date of birth

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 13.h),
                                child: CommonTextWidget(
                                  title: "dateOfBirthText".tr,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).titleTextColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => DatePicker.selectDate(context),
                                child: Container(
                                  height: 45.h,
                                  width:
                                      ((MyFunction.getWidth(context) - 58.w) /
                                          2),
                                  padding: EdgeInsets.all(0.5.sp),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).customPrimaryColor,
                                    boxShadow: [
                                      MyFunction.getBoxShadow(
                                          spreadRadius: 0,
                                          blurRadius: 15.sp,
                                          color: CustomColor.shadowColor
                                              .withOpacity(0.1),
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
                                      padding: EdgeInsets.fromLTRB(
                                          16.w, 0.h, 16.w, 0.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                              AssetString.cakeIconSvg),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.w, right: 8.w),
                                              child: Obx(
                                                () => Text(
                                                  datePickerData.inputDate
                                                              .value ==
                                                          ""
                                                      ? "ageText".tr
                                                      : datePickerData
                                                          .inputDate.value,
                                                  style: TextStyle(
                                                    color:
                                                        CustomColor.greyColor,
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
                          // CustomTextFieldWidget(
                          //     width: ((MyFunction.getWidth(context) - 58.w) / 2),
                          //     labelText: "dateOfBirthText".tr,
                          //     hintText: "dateOfBirthText".tr,
                          //     asset: AssetString.cakeIcon,
                          //     textEditingController:
                          //         dateOfBirthEditingController!),
                        ],
                      ),
                    ),
                    //?relation field
                    if (userStatus == UserStatus.single)
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20.h, left: 20.w, right: 20.w),
                        child: CommonDropDown(
                          labelText: "relationText".tr,
                          items: relationItems,
                          menuStateChange: (isOpen) {
                            if (!isOpen) {
                              relationEditingController?.clear();
                            }
                          },
                          text: relationEditingController?.text == ""
                              ? "selectYourRelationText".tr
                              : relationEditingController?.text as String,
                          isSearch: true,
                          type: 'relation',
                          menuHeight: 35.h,
                        ),
                      ),
                    //?gender selection
                    if (userStatus == UserStatus.withKids)
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: 20.h, left: 20.w, right: 20.w),
                          child: Row(
                            children: [
                              CustomRadioButton(
                                rightPadding: 14.w,
                                width:
                                    (MyFunction.getWidth(context) - 15.h) / 3,
                                isSvgIcon: true,
                                labelText: "genderText".tr,
                                title: "maleText".tr,
                                asset: AssetString.maleIcon,
                                textEditingController: maleEditingController!,
                                isBoxSelected: (gender == Gender.male),
                                onTap: () {
                                  gender = Gender.male;
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                width: 15.h,
                              ),
                              CustomRadioButton(
                                rightPadding: 14.w,
                                width:
                                    (MyFunction.getWidth(context) - 15.h) / 3,
                                isSvgIcon: true,
                                labelText: "",
                                title: "femaleText".tr,
                                asset: AssetString.femaleIcon,
                                textEditingController: femaleEditingController!,
                                isBoxSelected: (gender == Gender.female),
                                onTap: () {
                                  gender = Gender.female;
                                  setState(() {});
                                },
                              ),
                            ],
                          )),
                    //?qualification field
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 30.h, left: 20.w, right: 20.w),
                      child: CommonDropDown(
                        labelText: "qualificationText".tr,
                        items: qualificationItems,
                        menuStateChange: (isOpen) {
                          if (!isOpen) {
                            qualificationEditingController?.clear();
                          }
                        },
                        text: qualificationEditingController?.text == ""
                            ? "selectQualificationText".tr
                            : qualificationEditingController?.text as String,
                        isSearch: true,
                        type: 'qualification',
                        menuHeight: 35.h,
                      ),
                    ),

                    //?apply button
                    Padding(
                      padding: EdgeInsets.only(
                          left: 50.w, right: 50.w, bottom: 22.h),
                      child: CommonButton(
                        title: "applyText".tr,
                        onTap: () {
                          MyFunction.backFromScreen(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  static showProfileBottomSheet(
    BuildContext context,
    VoidCallback onTap,
  ) {
    Gender gender = Gender.male;
    showModalBottomSheet(
        context: context,

        // isDismissible: ,
        isDismissible: true,
        isScrollControlled: true,
        shape: MyFunction.getRoundedRectangleBorder(),
        elevation: 15,
        // barrierColor: CustomColor.transparent,
        backgroundColor: Theme.of(context).bottomSheetColor,
        builder: (context) {
          return SizedBox(
            width: double.infinity,
            height: (MyFunction.getHight(context) - 67.h),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //?appBar
                    CommonBottomSheetAppBar(
                      title: "myProfileText".tr,
                      isBackButton: false,
                      fontSize: 20.sp,
                    ),
                    //?divider
                    CustomDivider(
                      topPadding: 13.h,
                    ),
                    Container(
                      // height: double.fi,
                      width: MyFunction.getWidth(context),
                      padding: EdgeInsets.all(0.2.sp),
                      margin: EdgeInsets.only(left: 2.w, right: 2.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).customPrimaryColor,
                        boxShadow: [
                          MyFunction.getBoxShadow(
                              dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0)
                        ],
                        // border: Border.all(
                        //     color: CustomColor.linearSecondaryColor
                        //         .withOpacity(0.5)),
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                      ),
                      child: Column(children: [
                        // ?profile face
                        SizedBox(
                          height: 63.h + 50.r,
                          width: double.infinity,
                          child: Stack(children: [
                            // Container(
                            //   width: double.infinity,
                            //   height: 63.h,
                            //   decoration: BoxDecoration(
                            //     color: Theme.of(context).customPrimaryColor,
                            //     image: DecorationImage(
                            //         fit: BoxFit.fitWidth,
                            //         image:
                            //         AssetImage(AssetString.profileAsset)),
                            //   ),
                            // ),

                            Positioned(
                              top: -27.h,
                              left: -22.w,
                              right: -22.w,
                              child: ClipRRect(

                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8.sp),
                                    topLeft: Radius.circular(8.sp)),
                                child: Image.asset(AssetString.profileAsset),
                              ),
                            ),
                            Positioned(
                              top: 6.h,
                              left: 15.w,
                              child: CommonProfileFace(
                                radius: 50.r,
                                width: 3.sp,
                                isBorder: true,
                                image: AssetString.onboardingAsset,
                                borderColor:
                                Theme.of(context).customPrimaryColor,
                              ),
                            ),
                            Positioned(
                              top: 35.h,
                              left: 130.w,
                              child: Text(
                                "Jone Smith",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ]),
                        ),
                        // //?other user profile detail
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 20.h, left: 20.w, right: 20.w, top: 13.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(AssetString.maleIcon),
                                      Flexible(
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.w, right: 8.w),
                                            child: CommonTextWidget(
                                              title: "maleText".tr,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .skipTextColor,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 23.h,
                                      ),
                                      SvgPicture.asset(AssetString.cakeIconSvg),
                                      Flexible(
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 8.w, right: 8.w),
                                            child: CommonTextWidget(
                                              title: "17/07/1980",
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Theme.of(context)
                                                  .skipTextColor,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 15.h,
                                      ),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: CommonRowWidget(
                                    title: "9145632589",
                                    asset: AssetString.phoneIcon,
                                    isSvg: true,
                                    color: Theme.of(context).skipTextColor,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: CommonRowWidget(
                                    title: "social.infotech@example.com",
                                    isSvg: true,
                                    asset: AssetString.emailIcon,
                                    color: Theme.of(context).skipTextColor,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: CommonRowWidget(
                                    title: "surat",
                                    // asset: AssetString.locationIcon,
                                    color: Theme.of(context).skipTextColor,
                                    isSvg: true,
                                    asset: AssetString.locationIconSvg,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: CommonRowWidget(
                                    title:
                                        "108,bakti nanadan,mota varachha vdsfbvdbvbfvbds",
                                    // asset: AssetString.locationIcon,
                                    isSvg: true,
                                    asset: AssetString.locationIconSvg,
                                    color: Theme.of(context).skipTextColor,
                                  )),
                              //?divider
                              CustomDivider(topPadding: 13.h),
                              //? business detail
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 9.h, bottom: 13.h),
                                        child: CommonTextWidget(
                                          maxLines: 2,
                                          title: "businessDetailsText".tr,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Container(
                                      height: 175.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: CustomColor.lightGreyColor,
                                          borderRadius:
                                              BorderRadius.circular(8.sp),
                                          image: const DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  "https://burst.shopifycdn.com/photos/macbook-air-on-desk.jpg?width=925&format=pjpg&exif=1&iptc=1"))),
                                    ),
                                  ],
                                ),
                              ),
                              //? more business detail
                              Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 9.h, bottom: 13.h),
                                        child: CommonTextWidget(
                                          maxLines: 2,
                                          title: "moreBusinessImageText".tr,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    //GridView
                                    Wrap(
                                      spacing: 8, //vertical spacing
                                      runSpacing: 8, //horizontal spacing
                                      alignment: WrapAlignment.center,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          height: 100.h,
                                          width: (MyFunction.getWidth(context) -
                                                  92.w) /
                                              2,
                                          decoration: BoxDecoration(
                                              color: CustomColor.lightGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              image: const DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      "https://burst.shopifycdn.com/photos/macbook-air-on-desk.jpg?width=925&format=pjpg&exif=1&iptc=1"))),
                                        ),
                                        Container(
                                          height: 100.h,
                                          width: (MyFunction.getWidth(context) -
                                                  92.w) /
                                              2,
                                          decoration: BoxDecoration(
                                              color: CustomColor.lightGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              image: const DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      "https://burst.shopifycdn.com/photos/macbook-air-on-desk.jpg?width=925&format=pjpg&exif=1&iptc=1"))),
                                        ),
                                        Container(
                                          height: 175.h,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: CustomColor.lightGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              image: const DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                      "https://burst.shopifycdn.com/photos/macbook-air-on-desk.jpg?width=925&format=pjpg&exif=1&iptc=1"))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    //?profile detail

                    //? all member detail
                    Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 9.h, bottom: 13.h),
                                child: CommonTextWidget(
                                  title: "allMembersText".tr,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                )),

                            // empty Data
                            // Padding(
                            //   padding:  EdgeInsets.only(top:18.h),
                            //   child: EmptyData( emptyData: "emptyDataText".tr,),
                            // ),

                            CustomListViewWithCardWidget(
                              userStatus: UserStatus.single,
                              firstNameEditingController:
                                  TextEditingController(text: "abc"),
                              dateOfBirthEditingController:
                                  TextEditingController(text: "21-09-2006"),
                              relationEditingController:
                                  TextEditingController(text: "brotherGujText".tr),
                              maleEditingController:
                                  TextEditingController(text: "maleText".tr),
                              femaleEditingController:
                                  TextEditingController(text: "femaleText".tr),
                              qualificationEditingController:
                                  TextEditingController(text: "graduateText".tr),
                              image: AssetString.userDetail1,
                            ),
                          ],
                        )),

                    //?apply button
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: CommonButton(
                        title: "editProfileText".tr,
                        onTap: () {
                          Navigator.of(context).pop();

                          MyFunction.replaceScreen(context, "/manageProfile");
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static showFavoriteBottomSheet(
    BuildContext context,
    TextEditingController? reasonForTestController,
  ) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: MyFunction.getRoundedRectangleBorder(),
      elevation: 15,
      barrierColor: CustomColor.transparent,
      backgroundColor: Theme.of(context).customPrimaryColor,
      builder: (context) {
        return SizedBox(
          height: (MyFunction.getHight(context) - 67.h),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //?appBar
                Stack(
                  children: [
                    Center(
                      child: Text(
                        "favoriteText".tr,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20.sp,
                            color: Theme.of(context).secondaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.height * -0.012.w,
                      top: MediaQuery.of(context).size.height * -0.012.h,
                      child: IconButton(
                        onPressed: () {
                          MyFunction.backFromScreen(context);
                        },
                        icon: Icon(
                          Icons.close,
                          size: 24.h,
                        ),
                      ),
                    )
                  ],
                ),

                //?divider
                CustomDivider(topPadding: 13.h, bottomPadding: 0.h),
                //?profile detail
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(top: 22.h),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15.w,
                          childAspectRatio: 2 / 1.95),
                      itemBuilder: (context, i) {
                        return GestureDetector(
                          onTap: () {
                            MyBottomSheet.showUserProfileBottomSheet(
                                context, reasonForTestController);
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  margin: EdgeInsets.zero,
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: (ThemeManager
                                                      .instance.themeMode ==
                                                  ThemeMode.light)
                                              ? Theme.of(context).boxColor
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(8.sp),
                                          gradient: (ThemeManager
                                                      .instance.themeMode ==
                                                  ThemeMode.dark)
                                              ? MyFunction.boxGrdBackGround()
                                              : null,
                                          boxShadow: [
                                            MyFunction.getBoxShadow(
                                              dx: 0,
                                              dy: 4,
                                              blurRadius: 29,
                                              spreadRadius: 0,
                                              color: CustomColor.shadowColor
                                                  .withOpacity(0.12),
                                            ),
                                          ],
                                        ),
                                        height: 107.h,
                                        child: Card(
                                          margin: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.sp),
                                          ),
                                          elevation: 0.5,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              CommonTextWidget(
                                                title: "Robert Fox / 30",
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Theme.of(context)
                                                    .blackColor,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 15.h, top: 5.h),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      AssetString
                                                          .locationImageSvg,
                                                      color:
                                                          CustomColor.greyColor,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    CommonTextWidget(
                                                      title: "Surat",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          CustomColor.greyColor,
                                                    ),
                                                    SizedBox(
                                                      width: 7.w,
                                                    ),
                                                    SvgPicture.asset(
                                                      AssetString
                                                          .peopleImageSvg,
                                                      color:
                                                          CustomColor.greyColor,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    CommonTextWidget(
                                                      title: "3",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          CustomColor.greyColor,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10.h,
                                        right: 14.w,
                                        child: SvgPicture.asset(
                                          AssetString.favoriteImageSvg,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                top: -48.h,
                                child: ClipRRect(
                                  child: Image.asset(AssetString.userFace),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: 9,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static reportBottomSheet(
    BuildContext context,
    TextEditingController reasonForTestController,
  ) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: MyFunction.getRoundedRectangleBorder(),
      elevation: 15,
      backgroundColor: Theme.of(context).bottomSheetColor,
      builder: (context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20.w, 22.h, 20.w, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //?appBar
                CommonTextStleWidget(
                  title: "report".tr,
                  fontSize: 20.sp,
                  color: Theme.of(context).secondaryColor,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.left,
                ),
                //reason for test
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h, top: 25.h),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          reasonForTestController?.clear();
                        }

                        isMenuOpen = isOpen;
                        setState(() {});
                      },
                      hint: CommonTextWidget(
                        title: "reportForReport".tr,
                        fontSize: 14.sp,
                        color: CustomColor.darkGreyColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                      ),
                      items: reasonForItems.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: CommonTextWidget(
                            title: item,
                            fontSize: 14.sp,
                            color: Theme.of(context).secondaryColor,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }).toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        selectedValue = value;
                        setState(() {});
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45.h,
                        width: 316.w,
                        padding: EdgeInsets.only(
                          left: 14.w,
                          right: 14.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(
                            color: CustomColor.linearPrimaryColor,
                          ),
                          // color: Theme.of(context).lightWhiteShadeColor,
                          // boxShadow: [
                          //   MyFunction.getBoxShadow(
                          //       dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
                          // ],
                        ),
                        // elevation: 2,
                      ),
                      iconStyleData: IconStyleData(
                          icon: isMenuOpen != true
                              ? const Icon(
                                  Icons.arrow_drop_down,
                                  color: CustomColor.darkGreyColor,
                                )
                              : const Icon(Icons.arrow_drop_up,
                                  color: CustomColor.darkGreyColor)),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200,
                        width: 316.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(
                            color: CustomColor.linearSecondaryColor
                                .withOpacity(0.2),
                          ),
                          color: Theme.of(context).lightWhiteShadeColor,
                          boxShadow: [
                            MyFunction.getBoxShadow(
                                dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
                          ],
                        ),
                        offset: const Offset(0, -5),
                        scrollbarTheme: ScrollbarThemeData(
                            crossAxisMargin: 12.h,
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6.w),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                            thumbColor: MaterialStateProperty.all(
                                CustomColor.greyColor)),
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 30.h,
                        padding: EdgeInsets.only(
                            left: 14.w, right: 14.w, bottom: 0.h),
                      ),
                    ),
                  ),
                ),
                //description

                Padding(
                  padding: EdgeInsets.only(
                    bottom: 10.h,
                  ),
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      prefixIconConstraints: const BoxConstraints(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: const BorderSide(
                              width: 2, color: CustomColor.linearPrimaryColor)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide: const BorderSide(
                              width: 2, color: CustomColor.linearPrimaryColor)),
                      labelText: "descriptionText".tr,
                      labelStyle: TextStyle(
                        color: Theme.of(context).secondaryColor,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        // fixedSize: Size(100.w, 40.h),
                        side: const BorderSide(
                            color: CustomColor.linearPrimaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                      ),
                      onPressed: () {
                        MyFunction.backFromScreen(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: CommonTextStleWidget(
                          title: "submit".tr,
                          fontSize: 16.sp,
                          color: CustomColor.linearPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  static addAnnouncementSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: MyFunction.getRoundedRectangleBorder(),
      elevation: 15,
      backgroundColor: Theme.of(context).bottomSheetColor,
      builder: (context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.w, 22.h, 0.w, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      AssetString.logo,
                      height: 80.h,
                      width: 80.w,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
                      child: Text(
                        "sgkksText".tr,
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 22.sp,
                            color: Theme.of(context).secondaryColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w),
                    child: CommonTextStleWidget(
                      title: "announcementTermsText".tr,
                      letterSpacing: 0.5,
                      height: 1.5.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).secondaryColor,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 8.w, right: 22.w),
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
                            title: "acceptAndTerms".tr,
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Center(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          fixedSize: Size(100.w, 40.h),
                          side: const BorderSide(
                              color: CustomColor.linearPrimaryColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                        ),
                        onPressed: () {
                          if (isCheck == true) {
                            Navigator.of(context).pop();
                            MyFunction.replaceScreen(context, '/addAnnouncement');
                          }
                        },
                        child: CommonTextStleWidget(
                          title: "acceptText".tr,
                          fontSize: 16.sp,
                          color: CustomColor.linearPrimaryColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Roboto',
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  static imageUploadBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: MyFunction.getRoundedRectangleBorder(),
      elevation: 15,
      backgroundColor: Theme.of(context).bottomSheetColor,
      builder: (context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //?appBar
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 37.h,
                        child: Text(
                          "chooseImageText".tr,
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16.sp,
                              color: Theme.of(context).secondaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Positioned(
                      right: MediaQuery.of(context).size.height * -0.012.w,
                      top: MediaQuery.of(context).size.height * -0.012.h,
                      child: IconButton(
                          onPressed: () {
                            MyFunction.backFromScreen(context);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 22.h,
                          )),
                    )
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 18.h, bottom: 20.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            color: CustomColor.linearPrimaryColor,
                            size: 37,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CommonTextWidget(
                            title: "cameraText".tr,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).blackColor,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.photo_album,
                            color: CustomColor.linearPrimaryColor,
                            size: 37,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CommonTextWidget(
                            title: "GalleryText".tr,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).blackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
      },
    );
  }

  static showUserProfileBottomSheet(
    BuildContext context,
    TextEditingController? reasonForTestController,
  ) {
    Gender gender = Gender.male;
    showModalBottomSheet(
        context: context,

        // isDismissible: ,
        isDismissible: true,
        isScrollControlled: true,
        shape: MyFunction.getRoundedRectangleBorder(),
        elevation: 15,
        // barrierColor: CustomColor.transparent,
        backgroundColor: Theme.of(context).bottomSheetColor,
        builder: (context) {
          return SizedBox(
            height: (MyFunction.getHight(context) - 67.h),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 22.h, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //?appBar
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              "profileText".tr,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20.sp,
                                  color: Theme.of(context).secondaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Positioned(
                            right:
                                MediaQuery.of(context).size.height * -0.012.w,
                            top: MediaQuery.of(context).size.height * -0.012.h,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    MyBottomSheet.reportBottomSheet(
                                        context, reasonForTestController!);
                                  },
                                  icon: Icon(
                                    Icons.error,
                                    size: 24.h,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    MyFunction.backFromScreen(context);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: 24.h,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //?divider
                    CustomDivider(topPadding: 13.h),
                    //?profile detail
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
                      child: Container(
                        // height: double.fi,
                        width: MyFunction.getWidth(context),
                        padding: EdgeInsets.all(0.2.sp),
                        margin: EdgeInsets.only(left: 2.w, right: 2.w),
                        decoration: BoxDecoration(
                          color: Theme.of(context).customPrimaryColor,
                          boxShadow: [
                            MyFunction.getBoxShadow(
                                dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0)
                          ],
                          // border: Border.all(
                          //     color: CustomColor.linearSecondaryColor
                          //         .withOpacity(0.5)),
                          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                        ),
                        child: Column(children: [
                          // ?profile face
                          SizedBox(
                            height: 63.h + 50.r,
                            child: Stack(children: [
                              // Container(
                              //   height: 63.h,
                              //   decoration: BoxDecoration(
                              //     color: Theme.of(context).customPrimaryColor,
                              //     image: DecorationImage(
                              //         fit: BoxFit.fitWidth,
                              //         image:
                              //             AssetImage(AssetString.profileAsset)),
                              //   ),
                              // ),
                              Positioned(
                                top: -27.h,
                                left: -22.w,
                                right: -22.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8.sp),
                                      topLeft: Radius.circular(8.sp)),
                                  child: Image.asset(AssetString.profileAsset),
                                ),
                              ),
                              Positioned(
                                top: 6.h,
                                left: 15.w,
                                child: CommonProfileFace(
                                  radius: 50.r,
                                  width: 3.sp,
                                  isBorder: true,
                                  image: AssetString.onboardingAsset,
                                  borderColor:
                                      Theme.of(context).customPrimaryColor,
                                ),
                              ),
                              Positioned(
                                top: 35.h,
                                left: 130.w,
                                child: Text(
                                  "Jone Smith",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ]),
                          ), // //?other user profile detail
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 20.h,
                                left: 20.w,
                                right: 20.w,
                                top: 13.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AssetString.maleIcon),
                                        Flexible(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.w, right: 8.w),
                                              child: CommonTextWidget(
                                                title: "maleText".tr,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .skipTextColor,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 23.h,
                                        ),
                                        SvgPicture.asset(
                                            AssetString.cakeIconSvg),
                                        Flexible(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.w, right: 8.w),
                                              child: CommonTextWidget(
                                                title: "17/07/1980",
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Theme.of(context)
                                                    .skipTextColor,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 15.h,
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: CommonRowWidget(
                                      title: "********89",
                                      asset: AssetString.phoneIcon,
                                      isSvg: true,
                                      color: Theme.of(context).skipTextColor,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: CommonRowWidget(
                                      title: "social.infotech@example.com",
                                      isSvg: true,
                                      asset: AssetString.emailIcon,
                                      color: Theme.of(context).skipTextColor,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: CommonRowWidget(
                                      title: "surat",
                                      // asset: AssetString.locationIcon,
                                      isSvg: true,
                                      asset: AssetString.locationIconSvg,
                                      color: Theme.of(context).skipTextColor,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: CommonRowWidget(
                                    title:
                                        "108,bakti nanadan,mota varachha vdsfbvdbvbfvbds",
                                    // asset: AssetString.locationIcon,
                                    isSvg: true,
                                    asset: AssetString.locationIconSvg,
                                    color: Theme.of(context).skipTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ),
                    //? all member detail
                    Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 9.h, bottom: 13.h),
                                child: CommonTextWidget(
                                  title: "allMembersText".tr,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                            CustomListViewWithCardWidget(
                              userStatus: UserStatus.single,
                              firstNameEditingController:
                                  TextEditingController(text: "abc"),
                              dateOfBirthEditingController:
                                  TextEditingController(text: "21-09-2006"),
                              relationEditingController:
                                  TextEditingController(text: "brotherGujText".tr),
                              maleEditingController:
                                  TextEditingController(text: "maleText".tr),
                              femaleEditingController:
                                  TextEditingController(text: "femaleText".tr),
                              qualificationEditingController:
                                  TextEditingController(text: "graduateText".tr),
                              image: AssetString.userDetail1,


                            ),

                            // GestureDetector(
                            //   onTap: (){
                            //   },
                            //   child: Stack(
                            //     children: [
                            //
                            //     DottedBorder(
                            //       dashPattern: const [8, 4, 8, 4],
                            //       borderType: BorderType.RRect,
                            //       radius: Radius.circular(7.sp),
                            //       color: CustomColor.linearSecondaryColor,
                            //       strokeWidth: 2,
                            //       strokeCap: StrokeCap.butt,
                            //       child: Container(
                            //         color:
                            //         Theme.of(context).memberBoxBackColor,
                            //         height: 100.h,
                            //         width: double.infinity,
                            //       ),
                            //     ),
                            //       //center of 130 container
                            //       Positioned(
                            //         top: (45.h - 27.r),
                            //         left: 0,
                            //         right: 0,
                            //         child: Column(
                            //           children: [
                            //             const Icon(Icons.add,size: 30,),
                            //             SizedBox(
                            //               height: 8.h,
                            //             ),
                            //             Padding(
                            //               padding:  EdgeInsets.only(left: 18.w,right: 18.w,bottom: 18.h),
                            //               child: CommonTextStleWidget(
                            //
                            //                 title: "addMemberText".tr,
                            //                 fontSize: 12.sp,
                            //                 fontWeight: FontWeight.w400,
                            //                 color: Theme.of(context).lightBlueTextColor,
                            //                 textAlign: TextAlign.center,
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        )),

                    //?apply button
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: CommonButton(
                        title: "closeText".tr,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class CommonRowWidget extends StatelessWidget {
  const CommonRowWidget({
    super.key,
    required this.title,
    required this.asset,
    this.isSvg = false,
    this.color,
  });
  final String title;
  final String asset;
  final bool isSvg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isSvg ? SvgPicture.asset(asset) : Image.asset(asset),
        Flexible(
          child: Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w),
              child: CommonTextWidget(
                maxLines: 2,
                title: title,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: color,
              )),
        ),
        SizedBox(
          width: 23.h,
        ),
      ],
    );
  }
}
