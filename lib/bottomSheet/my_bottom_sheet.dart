import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/bottomSheet/components/common_bottom_app_bar.dart';
import 'package:sgkks/bottomSheet/components/common_long_check_box_button.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_enum.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/theme/theme_manager.dart';
import 'package:sgkks/widget/common_button.dart';
import 'package:sgkks/widget/custom_listview_with_card_widget.dart';
import 'package:sgkks/widget/custom_listview_with_divider.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/custom_divider.dart';
import 'package:sgkks/widget/custom_radio_button.dart';
import 'package:sgkks/widget/custom_text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/language_controller.dart';
import '../localString/update_language.dart';
import '../shared_preference/shared_preference.dart';
import '../widget/common_dropdown.dart';

final LanguageController languageData = Get.put(LanguageController());

class MyBottomSheet {
  static List<String> relationItems = [
    'Brother',
    'Sister',
  ];
  static List<String> qualificationItems = [
    '10th Pass',
    '12th Pass',
    'Graduate',
    'Post Graduate',
  ];

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
        print("---->${languageData.selectedLanguage.value.tr}");
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
                    title: "doneText".tr,
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

                      await MySharedPreference.prefs.setString(
                          'localeTranslationStore', jsonEncode(jsonString));

                      route;
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
      BuildContext context, VoidCallback onTap, UserStatus userStatus) {
    TextEditingController addressEditingController = TextEditingController();
    Gender gender = Gender.male;
    showModalBottomSheet(
      context: context,
      // isDismissible: ,
      isDismissible: true,
      isScrollControlled: false,
      shape: MyFunction.getRoundedRectangleBorder(),
      elevation: 15,

      // barrierColor: CustomColor.transparent,
      backgroundColor: Theme.of(context).bottomNavigationBarColor,

      builder: (context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 580.h,
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
                    padding:
                        EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
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
                              color: CustomColor.whiteColor, width: 3.w),
                          gradient: (ThemeManager.instance.themeMode ==
                                  ThemeMode.light)
                              ? null
                              : MyFunction.selectedGradBackGround()),
                      child: Image.asset(AssetString.cameraWithOutIcon),
                    )
                        //     CircleAvatar(
                        //
                        //       backgroundColor: CustomColor.greyColor,
                        //       radius: 50.r,
                        //       child: Image.asset(AssetString.cameraWithOutIcon),
                        //     ),
                        ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
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
                              asset: AssetString.userIcon,
                              textEditingController: addressEditingController),
                        ),
                        //?date of birth
                        CustomTextFieldWidget(
                            width: ((MyFunction.getWidth(context) - 58.w) / 2),
                            labelText: "dateOfBirthText".tr,
                            hintText: "ageText".tr,
                            asset: AssetString.cakeIcon,
                            textEditingController: addressEditingController),
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
                            addressEditingController.clear();
                          }
                        },
                        text: "selectYourRelationText".tr,
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
                              width: (MyFunction.getWidth(context) - 15.h) / 3,
                              isSvgIcon: true,
                              labelText: "genderText".tr,
                              title: "maleText".tr,
                              asset: AssetString.maleIcon,
                              textEditingController: addressEditingController,
                              isBoxSelected: (gender == Gender.male),
                              onTap: () {
                                gender = Gender.male;
                              },
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
                              isBoxSelected: (gender == Gender.female),
                              onTap: () {
                                gender = Gender.female;
                              },
                            ),
                          ],
                        )),
                  //?qualification field
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 30.h, left: 20.w, right: 20.w),
                    child: CommonDropDown(
                      labelText: "qualificationText".tr,
                      items: qualificationItems,
                      menuStateChange: (isOpen) {
                        if (!isOpen) {
                          addressEditingController.clear();
                        }
                      },
                      text: "selectQualificationText".tr,
                      isSearch: true,
                      type: 'qualification',
                      menuHeight: 35.h,
                    ),
                  ),
                  //?apply button
                  Padding(
                    padding: EdgeInsets.only(left: 50.w, right: 50.w),
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
      },
    );
  }

  static showProfileBottomSheet(
    BuildContext context,
    VoidCallback onTap,
  ) {
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
        backgroundColor: Theme.of(context).bottomSheetColor,
        builder: (context) {
          return SizedBox(
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
                    CustomDivider(topPadding: 13.h),
                    //?profile detail
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
                          child: Stack(children: [
                            Container(
                              height: 63.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).customPrimaryColor,
                                image: DecorationImage(
                                    fit: BoxFit.fitWidth,
                                    image:
                                        AssetImage(AssetString.profileAsset)),
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
                                      Image.asset(AssetString.cakeIcon),
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
                                    asset: AssetString.locationIcon,
                                    color: Theme.of(context).skipTextColor,
                                  )),
                              Padding(
                                  padding: EdgeInsets.only(bottom: 20.h),
                                  child: CommonRowWidget(
                                    title:
                                        "108,bakti nanadan,mota varachha vdsfbvdbvbfvbds",
                                    asset: AssetString.locationIcon,
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
                            const CustomListViewWithCardWidget(),
                          ],
                        )),

                    //?apply button
                    Padding(
                      padding: EdgeInsets.only(left: 30.w, right: 30.w),
                      child: CommonButton(
                        title: "saveText".tr,
                        onTap: () {
                          Navigator.of(context).pop();

                          MyFunction.replaceScreen(context, "/home");
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
                CommonBottomSheetAppBar(
                    title: "favoriteText".tr,
                    isBackButton: false,
                    fontSize: 20.sp,
                    fontFamily: 'Roboto'),
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
                        return Stack(
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
                                        color:
                                            (ThemeManager.instance.themeMode ==
                                                    ThemeMode.light)
                                                ? Theme.of(context).boxColor
                                                : null,
                                        borderRadius:
                                            BorderRadius.circular(8.sp),
                                        gradient:
                                            (ThemeManager.instance.themeMode ==
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
                                              color:
                                                  Theme.of(context).blackColor,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 15.h, top: 5.h),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    AssetString.locationImage,
                                                    color:
                                                        CustomColor.greyColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  CommonTextWidget(
                                                    title: "Surat",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        CustomColor.greyColor,
                                                  ),
                                                  SizedBox(
                                                    width: 7.w,
                                                  ),
                                                  Image.asset(
                                                    AssetString.peopleImage,
                                                    color:
                                                        CustomColor.greyColor,
                                                  ),
                                                  SizedBox(
                                                    width: 5.w,
                                                  ),
                                                  CommonTextWidget(
                                                    title: "3",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
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
                                      child: Image.asset(
                                        AssetString.favoriteImage,
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
