import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';

import '../../utils/custom_color.dart';
import '../../utils/my_function.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_button.dart';
import '../../widget/common_text.dart';
import '../information/components/sign_up_widget.dart';
class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        // padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.108.h
        // // 85
        // ),
          height: MyFunction.getHight(context),
          width: MyFunction.getWidth(context),
          decoration: MyFunction.imageBackGround(
              Theme.of(context).onboardingBackGround),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 35.h, 0, 0.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(22.w, 0, 22.w, 0.h),
                  child: Stack(
                    children: [


                      //?back button
                      Align(
                        alignment: Alignment.centerLeft,
                        child: CommonBackButton(
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
                ),

                 Expanded(
                  child: SignUpWidget(),


                ),
                Padding(

                  padding: EdgeInsets.only(top: 0.h, bottom: 35.h,left: 44.w,right: 44.w),
                  child: CommonButton(
                      title: "doneText".tr,
                      // "viewProfileText".tr,
                      onTap: () {
                        MyFunction.backFromScreen(context);
                      }),
                ),
              ],
            ),
          )),
    );

  }
}
