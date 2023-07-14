import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';

class CommonBottomSheetAppBar extends StatelessWidget {
  const CommonBottomSheetAppBar({
    super.key,
    required this.title,
    this.isBackButton = true,
    this.fontSize,
    this.fontFamily,
  });
  final String title;
  final bool isBackButton;
  final double? fontSize;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          title,
          style: TextStyle(
              fontFamily: fontFamily ?? 'Poppins',
              fontSize: fontSize ?? 18.sp,
              color:Theme.of(context).secondaryColor,
              fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        if (isBackButton)
          IconButton(
              onPressed: () {
                MyFunction.backFromScreen(context);
              },
              icon: Icon(
                Icons.close,
                size: 22.h,
              ))
      ],
    );
  }
}
