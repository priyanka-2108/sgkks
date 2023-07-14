import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgkks/bottomSheet/my_bottom_sheet.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({
    super.key,
  });

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((response) async {
      MyBottomSheet.selectLanguageBottomSheet(context,  MyFunction().replaceScreenAfter(context, "/onboarding"),
      );
    });
    super.initState();
  }

  List<String> languageList = ["englishText".tr, "gujaratiText".tr];
  List<String> selectedLanguageList = ["englishText".tr];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MyFunction.getHight(context),
        width: MyFunction.getWidth(context),
        decoration: MyFunction.imageBackGround(AssetString.splashBackGround),
      ),
    );
  }
}
