import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';

Widget getPinPut(Function(bool) callback,BuildContext context) {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      boxShadow: [
        MyFunction.getBoxShadow(
            dx: 0,
            dy: 0,
            blurRadius: 25,
            spreadRadius: 1.0,
            color: CustomColor.shadowColor.withOpacity(0.15))
      ],
      color: Theme.of(context).customPrimaryColor,
      border:
          Border.all(color: CustomColor.linearSecondaryColor.withOpacity(0.4)),
      borderRadius: BorderRadius.circular(8.sp),
    ),
  );

  final focusedPinTheme = defaultPinTheme.copyDecorationWith(
    border: Border.all(color: CustomColor.linearSecondaryColor),
    borderRadius: BorderRadius.circular(8),
  );

  final submittedPinTheme = defaultPinTheme.copyWith(
    decoration: defaultPinTheme.decoration!.copyWith(
      color: Theme.of(context).customPrimaryColor,
      border: Border.all(color: CustomColor.linearSecondaryColor),
    ),
  );

  return Center(
    child: Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        callback(true);
        return s == '2222' ? null : 'Pin is incorrect';
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    ),
  );
}
