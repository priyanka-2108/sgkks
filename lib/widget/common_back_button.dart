import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/widget/gradient_icon.dart';

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key, this.onTap, this.color, this.boxShadow});
  final VoidCallback? onTap;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GestureDetector(
        onTap: onTap ??
            () {
              MyFunction.backFromScreen(context);
            },
        child: Container(
          decoration: BoxDecoration(
            color:color?? CustomColor.whiteColor,
            boxShadow:boxShadow??  [MyFunction.getBoxShadow()],
            borderRadius: BorderRadius.circular(7.sp),
          ),
          child: Builder(builder: (context) {
            return Padding(
              padding: EdgeInsets.fromLTRB(10.w, 8.h, 5.w, 8.h),
              child: GradientIcon(
                  Icons.arrow_back_ios, 18.h, MyFunction.getGradColor()),
            );
          }),
        ),
      ),
    );
  }
}
