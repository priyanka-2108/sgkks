import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/onboarding/components/custom_position_avatar_widget.dart';
import 'package:sgkks/module/onboarding/components/onboarding_text_widget.dart';
import 'package:sgkks/module/verification/components/pin_put.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/widget/common_back_button.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/common_button.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/custom_text_field_widget.dart';
import 'package:sgkks/widget/gradient_icon.dart';

import '../../../utils/theme/theme_manager.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  void initState() {
    super.initState();
    isPinSet = false;
    startTimer();
  }

  Duration _myDuration = Duration(minutes: 1, seconds: 30);
  late Timer _timer;
  late bool isPinSet;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        final seconds = _myDuration.inSeconds - 1;

        if (seconds < 0) {
          // setState(() {
          //   _myDuration = Duration(seconds: 60, minutes: 0);
          //   final seconds = _myDuration.inSeconds - 1;

          //   if (seconds < 0) {
          //     setState(() {
          //       final seconds = _myDuration.inSeconds - 1;
          //       _myDuration = Duration(seconds: 60, minutes: 0);
          //       timer.cancel();
          //       // isLoading = false;
          //     });
          //   } else {
          //     setState(() {
          //       _myDuration = Duration(seconds: seconds, minutes: 0);
          //     });
          //   }
          // });
        } else {
          setState(() {
            _myDuration = Duration(seconds: seconds, minutes: 1);
          });
        }
      },
    );
  }

  changeUIAccordingPin(bool isPinSet) {
    setState(() {
      isPinSet = isPinSet;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  TextEditingController mobileEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
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
                  //?verify asset
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Center(
                      child: Image.asset(AssetString.verificationAsset),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Center(
                      child: CommonTextWidget(
                          title: "verificationCodeText".tr,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.h),
                    child: Center(
                      child: Column(
                        children: [
                          CommonTextWidget(
                            title: "pleaseEnterVerificationCodeText".tr,
                            color: CustomColor.greyColor,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CommonTextWidget(
                            title: "${"sendToYouRegisteredMobileText".tr}.",
                            color: CustomColor.greyColor,
                            fontSize: 14.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //?
                  if (isPinSet)
                    Align(
                      alignment: Alignment.centerRight,
                      child: CommonTextWidget(
                        title: "50%",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  //? otp
                  getPinPut(changeUIAccordingPin,context),
                  //?second count
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Center(
                        child: CommonTextWidget(
                            title:
                                "${_myDuration.inMinutes.toString().padLeft(2, '0')} : ${_myDuration.inSeconds.toString().padLeft(2, '0')}",
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400)),
                  ),

                  //?verify button
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 17.h, left: 28.w, right: 28.w, top: 93.h),
                    child: CommonButton(
                        title: "verifyText".tr,
                        onTap: () {
                          MyFunction.replaceScreen(context, '/information');
                        }),
                  ),
                  //?resend
                  if (!isPinSet)
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonTextWidget(
                            title: "didNotReceiveCodeText".tr,
                            color: CustomColor.greyColor,
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            width: 5.h,
                          ),
                          Text(
                            "resendText".tr,
                            style: TextStyle(
                              color: Theme.of(context).skyTextColor,
                              fontSize: 12.0.sp,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
