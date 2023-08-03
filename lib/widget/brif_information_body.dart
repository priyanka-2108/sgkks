import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/information/components/custom_display_row_widget.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_profile_face.dart';
import 'package:sgkks/widget/common_text.dart';

import '../bottomSheet/my_bottom_sheet.dart';
import '../utils/my_enum.dart';

class BrifInformationBody extends StatefulWidget {
  final UserStatus? userStatus;
  final TextEditingController? firstNameEditingController;
  final TextEditingController? dateOfBirthEditingController;
  final TextEditingController? relationEditingController;
  final TextEditingController? maleEditingController;
  final TextEditingController? femaleEditingController;
  final TextEditingController? qualificationEditingController;
  final String? image;
  final  Function()? onTap;
  const BrifInformationBody({
    super.key,this.userStatus, this.firstNameEditingController, this.dateOfBirthEditingController, this.relationEditingController, this.maleEditingController, this.femaleEditingController, this.qualificationEditingController, this.image, this.onTap,
  });

  @override
  State<BrifInformationBody> createState() => _BrifInformationBodyState();
}

class _BrifInformationBodyState extends State<BrifInformationBody> {
@override
  void initState() {
    // TODO: implement initState
    print("---->${widget.userStatus}");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CommonProfileFace(
            isBorder: false, image: AssetString.onboardingAsset, radius: 24.r),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonTextWidget(
                  title: "Jacob Jones",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color:  Theme.of(context).lightBlueTextColor,
                ),
                SizedBox(
                  height: 6.sp,
                ),
                //?people detail & age detail
                CustomDisplayRowWidget(
                  fistAsset: AssetString.peopleIconSvg,
                  fistTitle: "brotherText".tr,
                  secondAsset: AssetString.cakeIconSvg,
                  secondTitle: '24',
                )
              ],
            ),
          ),
        ),
        // //?edit icon
        GestureDetector(onTap: (){  MyBottomSheet.addDetailBottomSheet(context, () {}, widget.userStatus!,widget.firstNameEditingController,widget.dateOfBirthEditingController,widget.relationEditingController,widget.maleEditingController,widget.femaleEditingController,widget.qualificationEditingController,widget.image);},child: SvgPicture.asset(AssetString.editIcon)),
        SizedBox(
          width: 8.w,
        ),
        // //?delete icon
        GestureDetector(onTap:widget.onTap,child: SvgPicture.asset(AssetString.deleteIcon))
      ],
    );
  }
}
