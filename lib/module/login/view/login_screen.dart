import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/onboarding/components/custom_position_avatar_widget.dart';
import 'package:sgkks/module/onboarding/components/onboarding_text_widget.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/common_button.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/custom_text_field_widget.dart';

import '../../../utils/theme/theme_manager.dart';
import '../../../widget/common_back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController mobileEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MyFunction.getHight(context),
            width: MyFunction.getWidth(context),
            decoration:
                MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
            child: Padding(
              padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 35.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //?skip button
                  Padding(
                    padding: EdgeInsets.only(bottom: 34.h),
                    child: Stack(
                      children: [
                        CommonBackButton(color:Theme.of(context).backIconColor,
                          boxShadow:(ThemeManager.instance.themeMode == ThemeMode.light)
                              ?[MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.1),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            dx: 0.0, dy : 4.0,),] :  [MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.31),
                            blurRadius: 26.0,
                            spreadRadius: 0.0,
                            dx: 0.0, dy : 1.0,),],),
                        GestureDetector(
                          onTap: () {
                            MyFunction.replaceScreen(context, '/home');
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CommonTextWidget(
                                title: "skipText".tr,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                            color: Theme.of(context).skipTextColor,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //?welComeBack mess
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Center(
                      child: CommonTextWidget(
                          title: "welComeBackMess".tr,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                        color:Theme.of(context).skipTextColor,),
                    ),
                  ),
                  //login to existent account
                  Padding(
                    padding: EdgeInsets.only(bottom: 45.h),
                    child: Center(
                      child: CommonTextWidget(
                          color: CustomColor.greyColor,
                          title: "loginToYourExistentAccount".tr,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  //?login asset
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Center(
                      child: Image.asset(AssetString.loginAsset),
                    ),
                  ),
                  //?mobile textFelid
                  CustomTextFieldWidget(
                      asset: AssetString.userIcon,
                      hintText: "enterYourMobileNumberText".tr,
                      labelText: "mobileText".tr,
                      textEditingController: mobileEditingController,color: Theme.of(context).skyTextColor,),
                  //?send code mess
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 36.h),
                    child: Center(
                      child: Column(
                        children: [
                          CommonTextWidget(
                            title: "weWillSendVerificationCodeText".tr,
                            color: CustomColor.greyColor,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CommonTextWidget(
                            title: "${"mobileNumberText".tr}.",
                            color: CustomColor.greyColor,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //?login button
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 17.h, left: 28.w, right: 28.w),
                    child: CommonButton(
                        title: "capitalLogInText".tr,
                        onTap: () {
                          MyFunction.replaceScreen(context, '/verification');
                        }),
                  ),
                  //?do not have account
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextWidget(
                          title: "doNotHaveAccountText".tr,
                          color: CustomColor.greyColor,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                        CommonTextWidget(
                          title: "${"signUpText".tr}.",
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                          color:Theme.of(context).skyTextColor,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ));
  }
}
