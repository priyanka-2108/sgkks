import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';

import '../../utils/my_function.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_button.dart';
import '../../widget/common_text.dart';

class SamajBhavanScreen extends StatefulWidget {
  const SamajBhavanScreen({Key? key}) : super(key: key);

  @override
  State<SamajBhavanScreen> createState() => _SamajBhavanScreenState();
}

class _SamajBhavanScreenState extends State<SamajBhavanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MyFunction.getWidth(context),
        decoration:
            MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
        child: SafeArea(
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
                          title: "samajBhavanText".tr,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22.w, top: 35.h),
                    child: CommonBackButton(
                      onTap: () {
                        MyFunction.replaceScreen(context, '/home');
                      },
                      color: Theme.of(context).backIconColor,
                      boxShadow: (ThemeManager.instance.themeMode ==
                              ThemeMode.light)
                          ? [
                              MyFunction.getBoxShadow(
                                color: CustomColor.shadowColor.withOpacity(0.1),
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
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: 20.w, vertical: 8.h),
                    //   child: InkWell(
                    //     onTap: () {
                    //       MyFunction.replaceScreen(
                    //           context, '/announcementDetail');
                    //     },
                    //     child: Container(
                    //       // height: 112.h,
                    //       decoration: BoxDecoration(
                    //         color: Theme.of(context).cardBackColor,
                    //         boxShadow: [
                    //           MyFunction.getBoxShadow(
                    //             dx: 0,
                    //             dy: 4,
                    //             blurRadius: 15,
                    //             spreadRadius: 0,
                    //             color:
                    //                 CustomColor.shadowColor.withOpacity(0.1),
                    //           )
                    //         ],
                    //         borderRadius: BorderRadius.circular(4.sp),
                    //       ),
                    //       child: Row(
                    //         // crossAxisAlignment: CrossAxisAlignment.start,
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Expanded(
                    //             child: Column(
                    //               crossAxisAlignment:
                    //                   CrossAxisAlignment.start,
                    //               children: [
                    //                 Padding(
                    //                   padding: EdgeInsets.only(
                    //                       left: 13.0.w,
                    //                       top: 13.h,
                    //                       bottom: 5.h),
                    //                   child: Row(
                    //                     children: [
                    //                       ClipRRect(
                    //                         borderRadius:
                    //                             BorderRadius.circular(4.sp),
                    //                         child: Container(
                    //                           height: 34.h,
                    //                           width: 34.h,
                    //                           decoration: BoxDecoration(
                    //                             color: CustomColor
                    //                                 .whiteShadoColor,
                    //                             boxShadow: [
                    //                               MyFunction.getBoxShadow(
                    //                                 dx: 0,
                    //                                 dy: 4,
                    //                                 blurRadius: 15,
                    //                                 spreadRadius: 0,
                    //                                 color: CustomColor
                    //                                     .shadowColor
                    //                                     .withOpacity(0.1),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           child: Image.asset(
                    //                             AssetString.sliderImage1,
                    //                             fit: BoxFit.fill,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       Flexible(
                    //                         child: Padding(
                    //                           padding:
                    //                               EdgeInsets.only(left: 8.w),
                    //                           child: CommonTextStleWidget(
                    //                             title:
                    //                                 "samajBhavanTitleText".tr,
                    //                             // ${"postedText".tr}
                    //                             fontSize: 12.sp,
                    //                             height: 1.5.h,
                    //                             fontWeight: FontWeight.w500,
                    //                             color: Theme.of(context)
                    //                                 .lightBlueTextColor,
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 Padding(
                    //                   padding: EdgeInsets.only(
                    //                       left: 15.w, top: 10.h),
                    //                   child: Text(
                    //                     "ahmedabadText".tr,
                    //                     style: TextStyle(
                    //                       fontSize: 12.sp,
                    //                       fontWeight: FontWeight.w400,
                    //                       color: Theme.of(context)
                    //                           .lightWhiteColor,
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 Padding(
                    //                   padding: EdgeInsets.only(
                    //                       left: 15.w, top: 5.h),
                    //                   child: CommonTextStleWidget(
                    //                     title: "addressSamajText".tr,
                    //                     height: 1.5.h,
                    //                     fontSize: 12.sp,
                    //                     fontWeight: FontWeight.w400,
                    //                     color:
                    //                         Theme.of(context).lightWhiteColor,
                    //                   ),
                    //                 ),
                    //                 Padding(
                    //                   padding: EdgeInsets.only(
                    //                       left: 13.w,
                    //                       top: 10.h,
                    //                       bottom: 13.h),
                    //                   child: Container(
                    //                     child: CommonSmallCallButton(
                    //                       title: "callText".tr,
                    //                       onTap: () {
                    //                         MyFunction.backFromScreen(
                    //                             context);
                    //                       },
                    //                       radius: 8.sp,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding: EdgeInsets.only(
                    //                 left: 13.w, right: 13.w, top: 20.h),
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                   border: Border.all(
                    //                       color: CustomColor.greyColor
                    //                           .withOpacity(0.2),
                    //                       width: 1),
                    //                   shape: BoxShape.circle),
                    //               child: Image.asset(
                    //                 AssetString.locationSamajImage,
                    //                 height: 70.h,
                    //                 width: 70.h,
                    //               ),
                    //             ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 22.w, right: 22.w, top: 15.h,bottom: 15.h),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 160.h,
                            width: double.infinity,
                            child: Image.asset(
                              Theme.of(context).samajBhavanBg,
                              fit: BoxFit.fill,

                            ),
                          ),
                          Positioned(
                            top: 12.h,
                            left: 54.w,
                            right: 54.w,
                            child: CommonTextStleWidget(
                              title: "samajBhavanTitleText".tr,
                              // ${"postedText".tr}
                              textAlign: TextAlign.center,
                              fontSize: 14.sp,
                              height: 1.5.h,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).lightBlueTextColor,
                            ),
                          ),
                          Positioned(
                            left: 20.w,
                            bottom: 20.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ahmedabadText".tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).lightWhiteColor,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: SizedBox(
                                    width: 134.w,
                                    child: CommonTextStleWidget(
                                      title: "addressSamajText".tr,
                                      height: 1.5.h,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Theme.of(context).lightWhiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: 22.w,right: 22.w, bottom: 15.h),
                      child: Stack(
                        children: [
                          SizedBox(

                            height: 160.h,
                            width: double.infinity,
                            child: Image.asset(
                             Theme.of(context).samajBhavanBg1,
                              fit: BoxFit.fill,

                            ),
                          ),
                          Positioned(
                            top: 12.h,
                            left: 54.w,
                            right: 54.w,

                            child: CommonTextStleWidget(
                              title: "samajBhavanTitleText".tr,
                              // ${"postedText".tr}
                              textAlign: TextAlign.center,
                              fontSize: 14.sp,
                              height: 1.5.h,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).lightBlueTextColor,
                            ),
                          ),
                          Positioned(
                            left: 20.w,
                            bottom: 20.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ahmedabadText".tr,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).lightWhiteColor,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: SizedBox(
                                    width: 134.w,
                                    child: CommonTextStleWidget(
                                      title: "addressSamajText".tr,
                                      height: 1.5.h,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Theme.of(context).lightWhiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
