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

class CommonStatusBodyWidget extends StatelessWidget {
  const CommonStatusBodyWidget(
      {super.key, required this.title, required this.userStatus});
  final String title;
  final UserStatus userStatus;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //?add your siblings details
        Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: CustomAddPhotoWidget(
              title: title,
              onTap: () {
                MyBottomSheet.addDetailBottomSheet(context, () {}, userStatus);
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
                          title: title,
                          onTap: () {
                            MyBottomSheet.addDetailBottomSheet(
                                context, () {}, userStatus);
                          },
                        ),
    const CustomDivider(
    topPadding: 0,
    bottomPadding: 0,
    ),
                        const CustomListViewWithDivider(),
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
