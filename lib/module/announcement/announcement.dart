import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_icon_button.dart';

import '../../utils/asset_string.dart';
import '../../utils/custom_color.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_text.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: MyFunction.getHight(context),
        width: MyFunction.getWidth(context),
        decoration:
            MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 0),
                child: Stack(
                  children: [
                    // announcement Text
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CommonTextWidget(
                          title: "announcementText".tr,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
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

                    Positioned(
                      right: 2.w,
                      child: commonIconButton(
                          color:Theme.of(context).iconBackColor,
                          boxShadow:[MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.1),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            dx: 0.0, dy : 4.0,),],
                        onTap: () {
                          MyFunction.replaceScreen(context, '/addAnnouncement');
                        },
                        icon: Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
              // detail
              //First card

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: InkWell(
                  onTap: (){
                    MyFunction.replaceScreen(
                        context, '/announcementDetail');
                  },
                  child: Container(

                    decoration: BoxDecoration(
                      color:Theme.of(context).cardBackColor,
                      boxShadow: [
                        MyFunction.getBoxShadow(
                            dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1), )
                      ],
                      borderRadius: BorderRadius.circular(4.sp),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 13.0.w, top: 13.h, bottom: 5.h),
                                child: Row(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          color: CustomColor.whiteShadoColor,
                                          boxShadow: [
                                            MyFunction.getBoxShadow(
                                                dx: 0,
                                                dy: 4,
                                                blurRadius: 15,
                                                spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1),),
                                          ],
                                        ),
                                        child: Image.asset(
                                          AssetString.sliderImage1,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: CommonTextWidget(
                                        title:
                                            "${"postedText".tr}Jone Smith",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).blueTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w, top: 0),
                                child: Text(
                                  "2023 Tata Harrier, Safari Bookings Open;",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Theme.of(context).lightBlueTextColor),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 13.w, top: 20.h, bottom: 0.h),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            AssetString.clockImage,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "10 min ago",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 10.sp,
                                                color: CustomColor.greyColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            AssetString.calenderImage,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "23 March, 2023",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 10.sp,
                                                color: CustomColor.greyColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 5.w, top: 5.h, bottom: 5.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.sp),
                            child: Image.asset(
                              AssetString.userDetail1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              //Second card

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: InkWell(
                  onTap: (){
                    MyFunction.replaceScreen(
                        context, '/announcementDetail');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardBackColor,
                      boxShadow: [
                        MyFunction.getBoxShadow(
                          dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1), )
                      ],
                      borderRadius: BorderRadius.circular(4.sp),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 13.0.w, top: 13.h, bottom: 10.h),
                          child: Row(
                            children: [
                              ClipOval(
                                child: Container(
                                  height: 25.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                    color: CustomColor.whiteShadoColor,
                                    boxShadow: [
                                      MyFunction.getBoxShadow(
                                        dx: 0,
                                        dy: 4,
                                        blurRadius: 15,
                                        spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1),),
                                    ],
                                  ),
                                  child: Image.asset(
                                    AssetString.sliderImage1,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: CommonTextWidget(
                                  title: "${"postedText".tr}Jone Smith",
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color:  Theme.of(context).blueTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.w, top: 0),
                          child: CommonTextWidget(
                            title: "2023 Tata Harrier, Safari Bookings Open;",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).lightBlueTextColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.w, top: 5.h),
                          child: Text(
                            "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. ",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: CustomColor.lightGreyShadeColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 13.w, right: 8.w, top: 8.h, bottom: 10.h),
                          child: Container(
                            width: 192.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetString.clockImage,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "10 min ago",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 10.sp,
                                          color: CustomColor.greyColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetString.calenderImage,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "23 March, 2023",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 10.sp,
                                          color: CustomColor.greyColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //third card
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: InkWell(
                  onTap: (){
                    MyFunction.replaceScreen(
                        context, '/announcementDetail');
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardBackColor,
                        boxShadow: [
                          MyFunction.getBoxShadow(
                            dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1), )
                        ],
                        borderRadius: BorderRadius.circular(4.sp),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.sp),
                                  topRight: Radius.circular(8.sp)),
                              child: Image.asset(
                                AssetString.userDetail2,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 13.0.w, top: 13.h, bottom: 10.h),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    height: 25.h,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                      color: CustomColor.whiteShadoColor,
                                      boxShadow: [
                                        MyFunction.getBoxShadow(
                                          dx: 0,
                                          dy: 4,
                                          blurRadius: 15,
                                          spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1),),
                                      ],
                                    ),
                                    child: Image.asset(
                                      AssetString.sliderImage1,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: CommonTextWidget(
                                    title: "${"postedText".tr}Jone Smith",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                    color:
                                    Theme.of(context).blueTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 13.w, right: 10.w, bottom: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetString.calenderImage,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "23 March, 2023",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 10.sp,
                                          color: CustomColor.greyColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetString.clockImage,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "10 min ago",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 10.sp,
                                          color: CustomColor.greyColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //Fourth card

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: InkWell(
                  onTap: (){
                    MyFunction.replaceScreen(
                        context, '/announcementDetail');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardBackColor,
                      boxShadow: [
                        MyFunction.getBoxShadow(
                          dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1), )
                      ],
                      borderRadius: BorderRadius.circular(4.sp),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 13.0.w, top: 13.h, bottom: 5.h),
                                child: Row(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        height: 25.h,
                                        width: 25.w,
                                        decoration: BoxDecoration(
                                          color: CustomColor.whiteShadoColor,
                                          boxShadow: [
                                            MyFunction.getBoxShadow(
                                              dx: 0,
                                              dy: 4,
                                              blurRadius: 15,
                                              spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1),),
                                          ],
                                        ),
                                        child: Image.asset(
                                          AssetString.sliderImage1,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: CommonTextWidget(
                                        title:
                                            "${"postedText".tr}Jone Smith",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color:  Theme.of(context).blueTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w, top: 0),
                                child: Text(
                                  "2023 Tata Harrier, Safari Bookings Open;",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color:
                                      Theme.of(context).lightBlueTextColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 13.w, top: 20.h, bottom: 0.h),
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            AssetString.clockImage,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "10 min ago",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 10.sp,
                                                color: CustomColor.greyColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            AssetString.calenderImage,
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Text(
                                            "23 March, 2023",
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 10.sp,
                                                color: CustomColor.greyColor,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 5.w, top: 5.h, bottom: 5.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.sp),
                            child: Image.asset(
                              AssetString.userDetail1,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
