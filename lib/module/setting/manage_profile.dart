import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/widget/common_back_button.dart';

import '../../utils/asset_string.dart';
import '../../utils/custom_color.dart';
import '../../utils/my_function.dart';
import '../../utils/my_string.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_card.dart';
import '../../widget/common_text.dart';

class ManageProfileScreen extends StatefulWidget {
  const ManageProfileScreen({super.key});

  @override
  State<ManageProfileScreen> createState() => _ManageProfileScreenState();
}

class _ManageProfileScreenState extends State<ManageProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MyFunction.getHight(context),
            width: MyFunction.getWidth(context),
            decoration:
                MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 15.h),
                      child: Stack(
                        children: [
                          // add Announcement Text
                          Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: CommonTextWidget(
                                title: "manageProfileText".tr,
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
                    ),
                    //personal Information
                    CommonCardWidget(
                      image: AssetString.aboutIcon,
                      onTap: () {},
                      title: "personalInfoText".tr,
                      height: 54.h,
                      fontWeight: FontWeight.w400,
                      imageCheck: true,
                      iconImage: AssetString.editImage,
                      padding: 12.w,
                    ),

                    //residential Information
                    CommonCardWidget(
                      image: AssetString.residentialIcon,
                      onTap: () {},
                      title: "residentialInformationText".tr,
                      height: 54.h,
                      fontWeight: FontWeight.w400,
                      imageCheck: true,
                      iconImage: AssetString.editImage,
                      padding: 12.w,
                    ),
                    //Business Information
                    CommonCardWidget(
                      image: AssetString.businessIcon,
                      onTap: () {},
                      title: "businessInformationText".tr,
                      height: 54.h,
                      fontWeight: FontWeight.w400,
                      imageCheck: true,
                      iconImage: AssetString.editImage,
                      padding: 12.w,
                    ),
                    //change Your Status
                    CommonCardWidget(
                      image: AssetString.statusIcon,
                      onTap: () {},
                      title: "changeYourStatusText".tr,
                      height: 54.h,
                      fontWeight: FontWeight.w400,
                      imageCheck: true,
                      iconImage: AssetString.editImage,
                      padding: 12.w,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
