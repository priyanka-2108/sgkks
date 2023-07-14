import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/my_function.dart';
import '../utils/asset_string.dart';
import '../utils/custom_color.dart';

class CustomAddImage extends StatelessWidget {
  final String image;
  const CustomAddImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h, right: 10.w),
            decoration: BoxDecoration(
                color: CustomColor.lightGreyColor,
                borderRadius: BorderRadius.circular(4.sp)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.sp),
              child: Image.asset(
                image,
              ),
            ),
          ),
          Positioned(
            top: 5.h,
            right: 5.w,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).whiteOpacityColor,
                boxShadow: [
                  MyFunction.getBoxShadow(
                      dx: 0, dy: 4, blurRadius: 34, spreadRadius: 0)
                ],
              ),
              width: 16.w,
              height: 16.h,
              child: Icon(
                Icons.close,
                color: Theme.of(context).iconColor,
                size: 14.h,
              ),
            ),
          )
        ],
      ),
    );
  }
}
