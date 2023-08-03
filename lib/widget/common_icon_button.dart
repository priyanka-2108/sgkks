import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/widget/gradient_icon.dart';

class commonIconButton extends StatelessWidget {
  const commonIconButton({super.key, required this.onTap, required this.icon, this.color, this.boxShadow, this.size});
  final VoidCallback onTap;
  final IconData icon;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 38.h,
          width: 36.w,
          decoration: BoxDecoration(
            color:color?? Theme.of(context).customPrimaryColor,
            boxShadow:boxShadow??  [MyFunction.getBoxShadow()],
            borderRadius: BorderRadius.circular(7.sp),
          ),
          child: Builder(builder: (context) {
            return GradientIcon(icon,size ?? 22.sp, MyFunction.getGradColor());
          }),
        ),
      ),
    );
  }
}
