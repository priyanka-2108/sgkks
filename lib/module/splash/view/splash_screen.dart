import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';

import '../../../utils/size_constant.dart';
import '../../onboarding/components/custom_position_avatar_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((response) async {
      MyFunction().replaceScreenAfter(context, "/selectLanguage");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        body: Container(
      height: MyFunction.getHight(context),
      width: MyFunction.getWidth(context),
      decoration: MyFunction.imageBackGround( Theme.of(context).onboardingBackGround),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(top:10.h + SizeConstant.hightToSkipBackButtonInTabView,),
                child: Center(
                  child: Image.asset(
                    AssetString.logo,
                    height: 80.h,
                    width: 80.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h,bottom: 30.h),
                child: Text(
                 "sgkksText".tr,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 25.sp,
                      color: Theme.of(context).secondaryColor,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 31.h,
                  ),
                  child: Stack(children: [
                    Image.asset(
                      AssetString.onboardingCircle1,

                    ),
                    CustomPositionAvatarWidget(
                      bottom: SizeConstant.onboardingCircleHight,
                      left: (SizeConstant.onboardingCircleWidth / 2) - 50,
                      right: (SizeConstant.onboardingCircleWidth / 2) + 50,
                      radius: 25.r,
                    ),
                    CustomPositionAvatarWidget(
                      bottom: SizeConstant.onboardingCircleHight + 10,
                      right: (SizeConstant.onboardingCircleWidth / 5),
                      left: (SizeConstant.onboardingCircleWidth / 2) + 70,
                      radius: 15.r,
                    ),
                    CustomPositionAvatarWidget(
                      right: SizeConstant.onboardingCircleWidth,
                      top: SizeConstant.onboardingCircleHight / 2,
                      bottom: SizeConstant.onboardingCircleHight / 2,
                      radius: 22.r,
                    ),
                    CustomPositionAvatarWidget(
                      left: SizeConstant.onboardingCircleWidth,
                      top: (SizeConstant.onboardingCircleHight / 2) - 20,
                      bottom: (SizeConstant.onboardingCircleHight / 2) + 20,
                      radius: 20.r,
                    ),
                    CustomPositionAvatarWidget(
                      top: SizeConstant.onboardingCircleHight,
                      right: (SizeConstant.onboardingCircleWidth / 2) - 50,
                      left: (SizeConstant.onboardingCircleWidth / 2) + 50,
                      radius: 20.r,
                    ),
                    CustomPositionAvatarWidget(
                      bottom:SizeConstant.onboardingCircleHight /5 ,
                      right: (SizeConstant.onboardingCircleWidth / 2) +55,
                      left: (SizeConstant.onboardingCircleWidth / 9),
                      radius: 15.r,
                    ),
                    CustomPositionAvatarWidget(
                      right: SizeConstant.onboardingCircleHight / 3,
                      top: (SizeConstant.onboardingCircleHight / 2) + 50,
                      bottom: (SizeConstant.onboardingCircleHight / 2) - 50,
                      radius: 12.r,
                    ),
                    CustomPositionAvatarWidget(
                      left: SizeConstant.onboardingCircleHight / 3,
                      bottom: (SizeConstant.onboardingCircleHight / 2) + 50,
                      top: (SizeConstant.onboardingCircleHight / 2) - 50,
                      radius: 12.r,
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
