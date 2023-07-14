import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((response) async {
      MyFunction().replaceScreenAfter(context, "/selectLanguage");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
        body: Container(
      height: MyFunction.getHight(context),
      width: MyFunction.getWidth(context),
      decoration: MyFunction.imageBackGround(AssetString.splashBackGround),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AssetString.logo,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Text(
             "sgkksText".tr,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25.sp,
                  color: Theme.of(context).secondaryColor,
                  fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
    super.dispose();
  }
}
