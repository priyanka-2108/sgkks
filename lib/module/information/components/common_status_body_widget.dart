import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/bottomSheet/my_bottom_sheet.dart';
import 'package:sgkks/module/information/components/custom_display_row_widget.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_enum.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/custom_add_photo_widget.dart';
import 'package:sgkks/widget/custom_divider.dart';
import 'package:sgkks/widget/custom_listview_with_divider.dart';

class CommonStatusBodyWidget extends StatefulWidget {
  const CommonStatusBodyWidget(
      {super.key, required this.title, required this.userStatus,required this.listTitle, this.firstNameEditingController, this.dateOfBirthEditingController, this.relationEditingController, this.maleEditingController, this.femaleEditingController, this.qualificationEditingController, this.image, });
  final String title;
  final UserStatus userStatus;
  final String listTitle;
  final TextEditingController? firstNameEditingController;
  final TextEditingController? dateOfBirthEditingController;
  final TextEditingController? relationEditingController;
  final TextEditingController? maleEditingController;
  final TextEditingController? femaleEditingController;
  final TextEditingController? qualificationEditingController;
  final String? image;

  @override
  State<CommonStatusBodyWidget> createState() => _CommonStatusBodyWidgetState();
}

class _CommonStatusBodyWidgetState extends State<CommonStatusBodyWidget> {
  final TextEditingController firstName= TextEditingController(text: "");
  final TextEditingController dateOfBirth= TextEditingController(text: "");
  final TextEditingController relation= TextEditingController(text: "");
  final TextEditingController male= TextEditingController(text: "");
  final TextEditingController female= TextEditingController(text: "");
  final TextEditingController qualification= TextEditingController(text: "");
  final String userImage = "";
  @override
  void initState() {


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //?add your siblings details
        Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: CustomAddPhotoWidget(
              title: widget.title,
              onTap: () {
                MyBottomSheet.addDetailBottomSheet(context, () {}, widget.userStatus,firstName,dateOfBirth,relation,male,female,qualification,userImage);
              },
            )),
        //?List of added person widget
        Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Column(
              children: [
                Container(
                  width: MyFunction.getWidth(context),
                  padding: EdgeInsets.all(0.5.sp),
                  decoration: BoxDecoration(
                    color:Theme.of(context).customPrimaryColor,
                    boxShadow: [
                      MyFunction.getBoxShadow(
                          dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
                    ],
                    border: Border.all(
                        color:
                            CustomColor.linearSecondaryColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 27.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAddPhotoWidget(
                          isBorderVisible: false,
                          title: widget.listTitle,
                          onTap: () {
                            MyBottomSheet.addDetailBottomSheet(
                                context, () {}, widget.userStatus,firstName,dateOfBirth,relation,male,female,qualification,userImage);
                          },
                        ),
    const CustomDivider(
    topPadding: 0,
    bottomPadding: 0,
    ),
                         CustomListViewWithDivider(userStatus: widget.userStatus,firstNameEditingController: widget.firstNameEditingController,dateOfBirthEditingController:widget.dateOfBirthEditingController,relationEditingController:widget.relationEditingController,maleEditingController:widget.maleEditingController,femaleEditingController:widget.femaleEditingController,qualificationEditingController:widget.qualificationEditingController,image:widget.image),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
