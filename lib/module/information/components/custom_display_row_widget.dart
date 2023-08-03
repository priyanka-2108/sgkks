import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/widget/common_text.dart';

class CustomDisplayRowWidget extends StatelessWidget {
  const CustomDisplayRowWidget({
    super.key,
    required this.fistAsset,
    required this.fistTitle,
    required this.secondAsset,
    required this.secondTitle,
  });
  final String fistAsset;
  final String fistTitle;
  final String secondAsset;
  final String secondTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //?people detail
        Expanded(
          flex: 2,
          child: Row(
            children: [
              SvgPicture.asset(
                fistAsset,
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(
                width: 7.sp,
              ),
              Flexible(
                child: CommonTextWidget(
                  title: fistTitle,
                  maxLines: 1,
                  color: CustomColor.greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 13.sp,
        ),
        //?age detail
        Expanded(
          flex: 2,
          child: Row(
            children: [
              SvgPicture.asset(secondAsset,   height: 20.h,
                width: 20.w,),
              SizedBox(
                width: 7.sp,
              ),
              Flexible(
                child: CommonTextWidget(
                  maxLines: 2,
                  title: secondTitle,
                  color: CustomColor.greyColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
