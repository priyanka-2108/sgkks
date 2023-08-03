import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/custom_color.dart';

import '../utils/asset_string.dart';
import 'common_text.dart';
class EmptyData extends StatelessWidget {
  final String emptyData;
  const EmptyData({Key? key, required this.emptyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Column(
      children: [
        SvgPicture.asset(AssetString.emptyDataImageSvg),
        Padding(
          padding:  EdgeInsets.only(top:10.h),
          child: CommonTextWidget(
            title: emptyData,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).blackColor,
          ),
        )
      ],
    ),);
  }
}
