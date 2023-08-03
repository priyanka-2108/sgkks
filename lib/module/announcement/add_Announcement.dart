import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_back_button.dart';
import 'package:sgkks/widget/cutom_long_text_field.dart';

import '../../dialogBox/my_dialog_box.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_button.dart';
import '../../widget/common_image_upload.dart';
import '../../widget/common_text.dart';
import '../../widget/custom_add_photo_widget.dart';
import '../../widget/custome_add_image.dart';

class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({super.key});

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  final List imageList = [
    AssetString.addImage1,
    AssetString.addImage2,
    AssetString.userDetail2,
    AssetString.peopleIcon,

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 35.h),
        height: MyFunction.getHight(context),
        width: MyFunction.getWidth(context),
        decoration:
            MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // add Announcement Text
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: CommonTextWidget(
                            title: "addAnnouncementText".tr,
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
                    ],
                  ),
                  //?add
                  //

                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 50.h),
                      child: ListView(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: CustomAddPhotoWidget(
                              title: "addImageText".tr,
                              onTap: () {
                                print("image");
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        MyDialogBox.ImageUploadDialogBox(
                                            context));
                              },
                            ),
                          ),
                          // Image
                          Row(children: imageList.map((value) {return CustomAddImage(
                            image:value,
                            onTap: () {
                              setState(() {
                                imageList.removeAt(imageList.indexOf(value));
                              });
                            },
                          );}).toList(),),



                          //?title widget
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.h, top: 20.h),
                            child: customLongTextField(
                              hintText: "writeTitleText".tr,
                              labelText: "titleText".tr,
                              fontSize: 16.sp,
                              color: Theme.of(context).lightBlueTextColor,
                              hight: 80.h,
                              fontFamily: 'Poppins',
                              dx: 0,
                              dy: 4,
                              blurRadius: 15,
                              spreadRadius: 0,
                              boxColor: Theme.of(context).cardBackColor,
                            ),
                          ),

                          //?description widget
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: customLongTextField(
                              hintText: "writeDescriptionText".tr,
                              labelText: "descriptionText".tr,
                              fontSize: 16.sp,
                              color: Theme.of(context).lightBlueTextColor,
                              hight: 150.h,
                              fontFamily: 'Poppins',
                              dx: 0,
                              dy: 4,
                              blurRadius: 15,
                              spreadRadius: 0,
                              boxColor: Theme.of(context).cardBackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //add button
              Positioned(
                bottom: 0.h,
                left: 28.w,
                right: 28.w,
                child: GestureDetector(
                  child: CommonButton(
                      title: "addAnnouncementGujText".tr,
                      onTap: () {
                        MyFunction.backFromScreen(context);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
