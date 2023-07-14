import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../utils/theme/theme_manager.dart';
import 'common_text.dart';

class CommonCardWidget extends StatelessWidget {
  const CommonCardWidget(
      {super.key,
      required this.onTap,
      required this.title,
      this.iconCheck,
      required this.image,
      this.color,
      this.height,
      this.fontWeight,
      this.icon,
      this.imageCheck,
      this.iconImage,
      this.padding});
  final Function() onTap;
  final String title;
  final bool? iconCheck;
  final String image;
  final Color? color;
  final double? height;
  final FontWeight? fontWeight;
  final IconData? icon;
  final bool? imageCheck;
  final String? iconImage;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(22.w, 0.h, 22.w, 15.h),
      height: height ?? 64.h,
      width: MyFunction.getWidth(context),
      decoration: BoxDecoration(
        color: Theme.of(context).cardBackColor,
        boxShadow: [
          MyFunction.getBoxShadow(
            dx: 0,
            dy: 4,
            blurRadius: 15,
            spreadRadius: 0,
            color: CustomColor.shadowColor.withOpacity(0.1),
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(8.sp),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.fromLTRB(padding ?? 15.w, 0.h, padding ?? 20.w, 0.h),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 34.h,
                width: 34.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: color == null
                      ? MyFunction.lightSelectedGradBackGround()
                      : null,
                  color: color?.withOpacity(0.2),
                ),
                child: Image.asset(image),
              ),
              SizedBox(
                width: 7.w,
              ),
              Expanded(
                child: CommonTextWidget(
                  title: title,
                  fontSize: 14.sp,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  color: Theme.of(context).blackColor,
                ),
              ),
              if (iconCheck == true)
                Icon(
                  icon,
                  color: CustomColor.greyColor,
                  size: 20.sp,
                ),
              if (imageCheck == true)
                Image.asset(
                  iconImage!,
                  color: (ThemeManager.instance.themeMode == ThemeMode.light)
                      ? null
                      : CustomColor.whiteColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommonCardListWidget extends StatefulWidget {
  const CommonCardListWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.subTitle,
    this.iconCheck,
    required this.image,
    this.onChanged,
  });
  final Function() onTap;
  final String title;
  final String subTitle;
  final bool? iconCheck;
  final String image;
  final Function(bool)? onChanged;

  @override
  State<CommonCardListWidget> createState() => _CommonCardListWidgetState();
}

class _CommonCardListWidgetState extends State<CommonCardListWidget> {
  bool? isSelect;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
    isSelect =ThemeManager.instance.getTheme();
    print("isSelecttt-->$isSelect");
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(builder: (context, theme, _) {
      return InkWell(
        onTap: widget.onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 34.h,
              width: 34.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: MyFunction.lightSelectedGradBackGround(),
              ),
              child: Image.asset(widget.image),
            ),
            SizedBox(
              width: 7.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonTextWidget(
                    title: widget.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CommonTextWidget(
                    title: widget.subTitle,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.greyShadeColor,
                  ),
                ],
              ),
            ),
            if (widget.iconCheck == false)
              Icon(
                Icons.arrow_forward_ios,
                color: CustomColor.greyColor,
                size: 20.sp,
              ),

            if (widget.iconCheck == true)
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  trackColor: CustomColor.whiteShadeColor,
                  activeColor: CustomColor.whiteShadeColor,
                  thumbColor: CustomColor.darkGreyColor,
                  value: isSelect ?? false,
                  onChanged: (value) async {
                    setState(() {
                      isSelect = value;

                      ThemeManager.instance.toggleTheme(isSelect!);
                    });

                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('themeModeStore', value);
                    isSelect = prefs.getBool('themeModeStore');
                  },
                ),
              ),
            // Switch(
            //   trackColor:
            //       MaterialStateProperty.all(CustomColor.whiteShadeColor),
            //   activeColor: CustomColor.darkGreyColor,
            //   inactiveThumbColor: CustomColor.darkGreyColor,
            //   value: isSelect ?? false,
            //   onChanged: (value) async {
            //     setState(() {
            //       isSelect = value;
            //
            //       ThemeManager.instance.toggleTheme(isSelect!);
            //     });
            //
            //     final SharedPreferences prefs =
            //         await SharedPreferences.getInstance();
            //     await prefs.setBool('themeModeStore', value);
            //     isSelect = prefs.getBool('themeModeStore');
            //
            //   },
            // ),
          ],
        ),
      );
    });
  }
}
