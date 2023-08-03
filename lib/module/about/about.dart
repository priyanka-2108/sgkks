import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';

import '../../utils/my_function.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_dropdown.dart';
import '../../widget/common_text.dart';
class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MyFunction.getHight(context),
        width: MyFunction.getWidth(context),
        decoration:
        MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 35.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    //?about information text
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: CommonTextWidget(
                          title: "aboutText".tr,
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
                  ],
                ),

                Expanded(
                  child: ListView(children: [
                    CommonTextStleWidget(
                      title: "aboutText1".tr,
                      letterSpacing: 0.5,

                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).secondaryColor,
                    ),






                  ],),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
