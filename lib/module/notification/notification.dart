import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';

import '../../utils/my_function.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_no_data_found.dart';
import '../../widget/common_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MyFunction.getHight(context),
        width: MyFunction.getWidth(context),
        decoration: MyFunction.imageBackGround(
            Theme.of(context).onboardingBackGround),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 35.h),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        //?notification  text
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: CommonTextWidget(
                              title: "notification".tr,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        //?back button
                        CommonBackButton(
                          color: Theme.of(context).backIconColor,
                          boxShadow: (ThemeManager.instance.themeMode ==
                              ThemeMode.light)
                              ? [
                            MyFunction.getBoxShadow(
                              color: CustomColor.shadowColor
                                  .withOpacity(0.1),
                              blurRadius: 15.0,
                              spreadRadius: 0.0,
                              dx: 0.0,
                              dy: 4.0,
                            ),
                          ]
                              : [
                            MyFunction.getBoxShadow(
                              color: CustomColor.shadowColor
                                  .withOpacity(0.31),
                              blurRadius: 26.0,
                              spreadRadius: 0.0,
                              dx: 0.0,
                              dy: 1.0,
                            ),
                          ],
                        ),
                      ],
                    ),

                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [

                      EmptyData( emptyData: "noDataFoundText".tr,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
