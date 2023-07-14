import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/theme/themes.dart';

import '../../bottomSheet/components/common_bottom_app_bar.dart';
import '../../bottomSheet/my_bottom_sheet.dart';
import '../../utils/my_string.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_button.dart';
import '../../widget/common_card.dart';
import '../../widget/common_dialog_box.dart';
import '../../widget/common_image_button.dart';
import '../../widget/common_text.dart';
import '../../widget/custom_language_select.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final TextEditingController englishEditingController =
      TextEditingController();
  final TextEditingController gujaratiEditingController =
      TextEditingController();


    @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(builder: (context, theme, _) {
      return Scaffold(

        body: SingleChildScrollView(
          child: Container(

            width: MyFunction.getWidth(context),
            decoration:
                MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // profile Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: CommonTextWidget(
                            title: "myProfileText".tr,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 22.w, top: 35.h),
                      child: CommonBackButton(
                        color: Theme.of(context).backIconColor,
                        boxShadow: (ThemeManager.instance.themeMode ==
                                ThemeMode.light)
                            ? [
                                MyFunction.getBoxShadow(
                                  color:
                                      CustomColor.shadowColor.withOpacity(0.1),
                                  blurRadius: 15.0,
                                  spreadRadius: 0.0,
                                  dx: 0.0,
                                  dy: 4.0,
                                ),
                              ]
                            : [
                                MyFunction.getBoxShadow(
                                  color:
                                      CustomColor.shadowColor.withOpacity(0.31),
                                  blurRadius: 26.0,
                                  spreadRadius: 0.0,
                                  dx: 0.0,
                                  dy: 1.0,
                                ),
                              ],
                      ),
                    ),
                    Positioned(
                      left: 258.w,
                      top: 35.h,
                      child: CommonImageButton(
                        onTap: () {},
                        image: AssetString.notificationImage,
                      ),
                    ),
                    Positioned(
                      left: 302.w,
                      top: 35.h,
                      child: CommonImageButton(
                        onTap: () {},
                        image: AssetString.heartIcon,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 92.h,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(22.w, 0, 22.w, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    gradient: MyFunction.selectedGradBackGround(),
                    boxShadow: [
                      MyFunction.getBoxShadow(
                          dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
                    ],
                  ),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Image.asset(
                          AssetString.boxImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0.w, top: 5.h, bottom: 5.h),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 62.h,
                              width: 62.w,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: CustomColor.lightGreyColor),
                                child: ClipRRect(
                                  child: Image.asset(
                                    AssetString.userImage6,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextStleWidget(
                                    title: "Alina Finiti",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5.h,
                                    color: CustomColor.whiteShadoColor,
                                    fontFamily: 'Poppins',
                                  ),
                                  CommonTextStleWidget(
                                    title: "alinfiniti1515689@gmail.com",
                                    height: 1.5.h,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: CustomColor.whiteShadoColor,
                                    fontFamily: 'Poppins',
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(22.w, 22.h, 22.w, 13.h),
                  child: CommonTextWidget(
                    title: "accountSettingText".tr,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color:
                    // Theme.of(context).appSubTitleColor,
                    Theme.of(context).blackColor,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(22.w, 0.h, 22.w, 15.h),
                  width: MyFunction.getWidth(context),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardBackColor,
                    boxShadow: [
                      MyFunction.getBoxShadow(
                        dx: 0,
                        dy: 4,
                        blurRadius: 15,
                        spreadRadius: 0,
                        color: CustomColor.shadowColor.withOpacity(0.1),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 0.h, 20.w, 0.h),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 11.h, top: 15.h),
                          child: CommonCardListWidget(
                            image: AssetString.userIcon,
                            onTap: () {
                              MyFunction.replaceScreen(
                                  context, '/manageProfile');
                            },
                            subTitle: "manageProfileSubtitleText".tr,
                            title: "manageProfileText".tr,
                            iconCheck: false,
                          ),
                        ),
                        //?divider
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: CustomColor.lightedGreyShadeColor
                              .withOpacity(0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                          child: CommonCardListWidget(
                            image: AssetString.modeIcon,
                            onTap: () {},
                            subTitle: "modeSubtitleText".tr,
                            title: "modeText".tr,
                            iconCheck: true,
                          ),
                        ),
                        //?divider
                        Divider(
                          height: 1.h,
                          thickness: 1.h,
                          color: CustomColor.lightedGreyShadeColor
                              .withOpacity(0.5),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h, top: 11.h),
                          child: CommonCardListWidget(
                            image: AssetString.languageIcon,
                            onTap: () {
                              MyBottomSheet.selectLanguageBottomSheet(
                                context,

                                MyFunction.backFromScreen(context),
                                true,
                              );
                            },
                            subTitle: "languageSubtitleText".tr,
                            title: "languageText".tr,
                            iconCheck: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //about us
                CommonCardWidget(
                  image: AssetString.aboutIcon,
                  onTap: () {},
                  title: "aboutText".tr,
                ),
                //privacy policy
                CommonCardWidget(
                  image: AssetString.privacyIcon,
                  onTap: () {},
                  title: "privacyPolicyText".tr,
                  iconCheck: true,
                  icon: Icons.arrow_forward_ios,
                ),
                //faq
                CommonCardWidget(
                  image: AssetString.faqIcon,
                  onTap: () {},
                  title: "faqText".tr,
                  iconCheck: true,
                  icon: Icons.arrow_forward_ios,
                ),
                //logout
                CommonCardWidget(
                  image: AssetString.logoutIcon,
                  onTap: () {
                    logoutDialog("logoutTitleText".tr,
                        "logoutSubTitleText".tr, AssetString.logoutImage);
                  },
                  title: "logoutText".tr,
                  iconCheck: true,
                  icon: Icons.arrow_forward_ios,
                  color: CustomColor.redColor,
                ),
                //dengerous
                Padding(
                  padding: EdgeInsets.fromLTRB(22.w, 7.h, 22.w, 13.h),
                  child: CommonTextWidget(
                    title: "dengerousText".tr,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).blackColor,
                    fontFamily: 'Poppins',
                  ),
                ),
                //delete
                CommonCardWidget(
                  image: AssetString.trashIcon,
                  onTap: () {
                    logoutDialog("deleteTitleText".tr,
                        "deleteSubTitleText".tr, AssetString.deleteImage);
                  },
                  title: "deleteAccountText".tr,
                  iconCheck: true,
                  icon: Icons.arrow_forward_ios,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  logoutDialog(String title, String subTitle, String image) {
    return showDialog(
      context: context,
      builder: (context) => CommonDialogBox(
        image: image,
        subTitle: subTitle,
        title: title,
      ),
    );
  }
}
