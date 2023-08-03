import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/widget/common_icon_button.dart';

import '../../bottomSheet/my_bottom_sheet.dart';
import '../../utils/my_function.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_button.dart';
import '../../widget/common_image_button.dart';
import '../../widget/common_text.dart';
import '../information/components/business_information_widget.dart';
import '../information/components/choose_your_status_widget.dart';
import '../information/components/residential_information.dart';
import '../information/components/sign_up_widget.dart';

class EditManageProfile extends StatefulWidget {
  final String routeName;
  const EditManageProfile({Key? key, required this.routeName})
      : super(key: key);

  @override
  State<EditManageProfile> createState() => _EditManageProfileState();
}

class _EditManageProfileState extends State<EditManageProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//       extendBody: true,
// bottomNavigationBar: IntrinsicHeight(
//   child:   Padding(
//     padding: EdgeInsets.only(top: 8.h, bottom: 35.h,left: 22.w,right: 22.w),
//     child: CommonButton(
//         title: "doneText".tr,
//         // "viewProfileText".tr,
//         onTap: () {
//           MyFunction.backFromScreen(context);
//         }),
//   ),
// ),
      body: Container(
        // padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.108.h
        // // 85
        // ),
          height: MyFunction.getHight(context),
          width: MyFunction.getWidth(context),
          decoration: MyFunction.imageBackGround(
              Theme.of(context).onboardingBackGround),
          child: Padding(
            padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 0.h),
            child: Column(
              children: [
                Stack(
                  children: [
                    // profile Text
                  if( widget.routeName == "personalInfo")  ...[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: CommonTextWidget(
                          title: "editProfileText".tr,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],

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

                    // Positioned(
                    //   right: 2.w,
                    //   child: CommonImageButton(
                    //     onTap: () {
                    //       MyFunction.replaceScreen(context, "/notification");
                    //     },
                    //     image: AssetString.notificationImage,
                    //   ),
                    // ),
                  ],
                ),
                // Expanded(
                //
                //   child: ListView(
                //     children: [
                //       if (widget.routeName == "personalInfo") ...[
                //         SignUpWidget(
                //           firstName: "abc",
                //           lastName: "xyz",
                //           fatherName: "pqr",
                //           dateOfBirth: "21-01-2004",
                //           email: "abc@gmail.com",
                //           qualification: "Graduate",
                //           isEdit: true,
                //           image: AssetString.userDetail1,
                //         )
                //       ] else if (widget.routeName == "residentialInfo") ...[
                //         const ResidentialInformationWidget(
                //           village: "abc",
                //           address: "xyz",
                //           state: "Gujarat",
                //           city: "Surat",
                //           isEdit: true,
                //
                //         ),
                //       ]else if (widget.routeName == "changeYourStatus") ...[
                //           ChooseYourStatusWidget(
                //            isEdit: true,
                //
                //              firstName:"abc",dateOfBirth:"21-09-2006",relation:"abc",maleGender:"male",femaleGender:"female",qualification:"other",  image: AssetString.userDetail1,
                //         )
                //       ] else ...[
                //         BusinessInformationWidget(
                //           isEdit: true,
                //         ),
                //       ],
                //
                //
                //
                //     ],
                //   ),
                // ),
                Expanded(
                  child:widget.routeName == "personalInfo" ?SignUpWidget(
                              firstName: "abc",
                              lastName: "xyz",
                              fatherName: "pqr",
                              dateOfBirth: "21-01-2004",
                              email: "abc@gmail.com",
                              qualification: "graduateText".tr,
                              isEdit: true,
                              image: AssetString.userDetail1,
                            ) : widget.routeName == "residentialInfo"?  ResidentialInformationWidget(
                    village: "abc",
                    address: "xyz",
                    state: "Gujarat",
                    city: "Surat",
                    isEdit: true,

                  ):widget.routeName == "changeYourStatus" ?ChooseYourStatusWidget(
               isEdit: true,

                 firstName:"abc",dateOfBirth:"21-09-2006",relation:"brotherGujText".tr,maleGender: "maleText".tr,femaleGender:"femaleText".tr,qualification:"graduateText".tr,  image: AssetString.userDetail1,
            )

                      :BusinessInformationWidget(
              isEdit: true,
            ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0.h, bottom: 35.h,left: 22.w,right: 22.w),
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
