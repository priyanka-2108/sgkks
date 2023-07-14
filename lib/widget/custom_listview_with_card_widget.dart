import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/brif_information_body.dart';

class CustomListViewWithCardWidget extends StatelessWidget {
  const CustomListViewWithCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(bottom: 15.h, left: 2.w, right: 2.w),
            width: MyFunction.getWidth(context) - 40.w,
            padding: EdgeInsets.all(0.5.sp),
            decoration: BoxDecoration(
              color: Theme.of(context).boxBackColor,
              borderRadius: BorderRadius.circular(8.sp),
              boxShadow: [
                MyFunction.getBoxShadow(
                    dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child: const BrifInformationBody(),
            ));
      },
    );
  }
}
