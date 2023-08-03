import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/onboarding/components/custom_position_avatar_widget.dart';
import 'package:sgkks/module/onboarding/components/onboarding_text_widget.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/widget/common_button.dart';
import 'package:sgkks/widget/common_profile_face.dart';

import '../../../shared_preference/shared_preference.dart';
import '../../information/view/set_information_screen.dart';
import 'package:circular_rotation/circular_rotation.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  Timer? _timer;


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
        if (_currentPage < 3) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    });
  }


  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Container(
          height: MyFunction.getHight(context),
          width: MyFunction.getWidth(context),
          decoration: MyFunction.imageBackGround(
              Theme.of(context).onboardingBackGround),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 81.h),
                  child: Text(
                    "welComeMess".tr,
                    style: TextStyle(
                        fontSize: 26.sp,
                        color: Theme.of(context).secondaryColor,
                        fontWeight: FontWeight.w600),
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
                        bottom: SizeConstant.onboardingCircleHight,
                        right: (SizeConstant.onboardingCircleWidth / 9),
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
                        right: (SizeConstant.onboardingCircleWidth / 2) +50,
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
                SizedBox(
                  height: 75.h,
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: MyFunction.getOnboardingPageViewList().length,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return OnboardingTextWidget(
                        textFirstLine:
                            MyFunction.getOnboardingPageViewList()[index]
                                .textFirstLine,
                        textSecondLineStart:
                            MyFunction.getOnboardingPageViewList()[index]
                                .textSecondLineStart,
                        textSecondLineMiddle:
                            MyFunction.getOnboardingPageViewList()[index]
                                .textSecondLineMiddle,
                        textSecondLineEnd:
                            MyFunction.getOnboardingPageViewList()[index]
                                .textSecondLineEnd,
                        isSecond: MyFunction.getOnboardingPageViewList()[index]
                            .isSecond,
                        isLang:MyFunction.getOnboardingPageViewList()[index]
                            .isLang,
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.h),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                            MyFunction.getOnboardingPageViewList().length,
                            (index) => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.h),
                                  child: GestureDetector(
                                    onTap: () {
                                      _pageController.animateToPage(index,
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    child: Container(
                                      height:
                                          _currentPage == index ? 8.h : 7.78.h,
                                      width:
                                          _currentPage == index ? 25.w : 7.78.w,
                                      decoration: BoxDecoration(
                                          color: _currentPage == index
                                              ? null
                                              : CustomColor.lightGreyColor,
                                          shape: _currentPage == index
                                              ? BoxShape.rectangle
                                              : BoxShape.circle,
                                          borderRadius: _currentPage == index
                                              ? BorderRadius.circular(50.sp)
                                              : null,
                                          gradient: _currentPage == index
                                              ? MyFunction.getGradColor()
                                              : null),
                                    ),
                                  ),
                                )),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 50.w, right: 50.w, top: 30.h),
                      child: CommonButton(
                        title: "signUpText".tr,
                        onTap: () {
                          MyFunction.replaceScreen(context, '/login',[
                            { "title":"signUpNewText".tr,"subTitle" :"createAccountMess".tr , "buttonText":"signUpCamelCaseText".tr,"isLogin": "register",}]);
                          // MyFunction.replaceScreen(context, '/information');
                          // MyFunction()
                          //     .replaceScreenAfter(context, "/information");
                        },
                        isBorder: false,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 50.w, right: 50.w, top: 12.h,bottom: 12.h),
                      child: CommonButton(
                          title: "logInText".tr,
                          isBorder: true,
                          onTap: () {
                            print("clicked");
                            MyFunction.replaceScreen(context, '/login',[
                              { "title":"welComeBackMess".tr,"subTitle" :"loginToYourExistentAccount".tr , "buttonText":"capitalLogInText".tr,"isLogin": "login",}]);
                            // MyFunction().replaceScreenAfter(context, "/login");
                          }),
                    ),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 100.h),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: List<Widget>.generate(
                //         MyFunction.getOnboardingPageViewList().length,
                //         (index) => Padding(
                //               padding: EdgeInsets.symmetric(horizontal: 5.h),
                //               child: GestureDetector(
                //                 onTap: () {
                //                   _pageController.animateToPage(index,
                //                       duration:
                //                           const Duration(milliseconds: 300),
                //                       curve: Curves.easeIn);
                //                 },
                //                 child: Container(
                //                   height: _currentPage == index ? 8.h : 7.78.h,
                //                   width: _currentPage == index ? 25.w : 7.78.w,
                //                   decoration: BoxDecoration(
                //                     color:_currentPage == index ? null: CustomColor.lightGreyColor,
                //                       shape: _currentPage == index
                //                           ? BoxShape.rectangle
                //                           : BoxShape.circle,
                //                       borderRadius: _currentPage == index
                //                           ? BorderRadius.circular(50.sp)
                //                           : null,
                //                       gradient: _currentPage == index
                //                           ? MyFunction.getGradColor()
                //                           : null),
                //                 ),
                //               ),
                //             )),
                //   ),
                // ),
                // const Spacer()
              ],
            ),
          ),
        ));
  }
}
