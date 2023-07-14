import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/custom_color.dart';
import '../utils/my_function.dart';

class CommonImageButton extends StatelessWidget {
  const CommonImageButton(
      {super.key, required this.onTap, required this.image});
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 34.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(

          decoration: BoxDecoration(
            color: Theme.of(context).backgroundWhiteColor,
            boxShadow: [
              MyFunction.getBoxShadow(
                blurRadius: 15,
                spreadRadius: 0,
                dx: 0,
                dy: 4,
              )
            ],
            borderRadius: BorderRadius.circular(7.sp),
          ),
          child: Builder(builder: (context) {
            return Padding(
              padding: EdgeInsets.all(7.w),
              child: Image.asset(image),
            );
          }),
        ),
      ),
    );
  }
}
