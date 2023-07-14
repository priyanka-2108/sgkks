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
import 'package:sgkks/widget/common_button.dart';
import 'package:sgkks/widget/common_profile_face.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
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
          decoration:
              MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
          child: Stack(children: [
            Column(
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
                        color:Theme.of(context).secondaryColor,
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
                        AssetString.onboardingCircle,
                      ),
                      CustomPositionAvatarWidget(
                        bottom: SizeConstant.onboardingCircleHight,
                        left: (SizeConstant.onboardingCircleWidth / 2) - 50,
                        right: (SizeConstant.onboardingCircleWidth / 2) + 50,
                        radius: 25.r,
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
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: PageView.builder(
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
                        );
                      },
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(bottom: 200.h),
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
            Positioned(
              bottom: 68.h,
              left: 0,
              right: 0,
              child: Column(
                children: [
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      MyFunction.getOnboardingPageViewList().length,
                      (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.h),
                            child: GestureDetector(
                              onTap: () {
                                _pageController.animateToPage(index,
                                    duration:
                                        const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                height: _currentPage == index ? 8.h : 7.78.h,
                                width: _currentPage == index ? 25.w : 7.78.w,
                                decoration: BoxDecoration(
                                  color:_currentPage == index ? null: CustomColor.lightGreyColor,
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.w, right: 50.w),
                    child: CommonButton(
                      title: "signUpText".tr,
                      onTap: () {
                        MyFunction()
                            .replaceScreenAfter(context, "/information");
                      },
                      isBorder: false,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50.w, right: 50.w),
                    child: CommonButton(
                        title: "logInText".tr,
                        isBorder: true,
                        onTap: () {
                          MyFunction().replaceScreenAfter(context, "/login");
                        }),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
