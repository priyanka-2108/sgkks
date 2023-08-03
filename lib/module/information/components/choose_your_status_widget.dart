import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/information/components/common_status_body_widget.dart';
import 'package:sgkks/module/information/model/user_status_model.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/my_enum.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/utils/size_constant.dart';
import 'package:sgkks/widget/common_text.dart';
import 'package:sgkks/widget/custom_divider.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/theme/theme_manager.dart';

class ChooseYourStatusWidget extends StatefulWidget {
  final bool? isEdit;
  final String? firstName;
  final String? dateOfBirth;
  final String? relation;
  final String? maleGender;
  final String? femaleGender;

  final String? qualification;
  final String? image;

  const ChooseYourStatusWidget({
    super.key,
    this.isEdit, this.firstName, this.dateOfBirth, this.relation, this.maleGender, this.femaleGender, this.qualification, this.image,

  });

  @override
  State<ChooseYourStatusWidget> createState() => _ChooseYourStatusWidgetState();
}

class _ChooseYourStatusWidgetState extends State<ChooseYourStatusWidget> {
   TextEditingController? firstNameEditingController;
   TextEditingController? dateOfBirthEditingController;
   TextEditingController? relationEditingController;
   TextEditingController? maleEditingController;
   TextEditingController? femaleEditingController;
   TextEditingController? qualificationEditingController;
  static List<UserStatusModel> userStatusList = [];

  List<UserStatusModel> selectedUserStatusList = [];

   @override
   void initState() {
     firstNameEditingController = TextEditingController(text: widget.firstName);
     dateOfBirthEditingController = TextEditingController(text: widget.dateOfBirth);
     relationEditingController = TextEditingController(text: widget.relation);
     maleEditingController = TextEditingController(text: widget.maleGender);
     femaleEditingController = TextEditingController(text: widget.femaleGender);
     qualificationEditingController = TextEditingController(text: widget.qualification);
     super.initState();
   }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userStatusList = [
      UserStatusModel(
        statusAsset: AssetString.singleIcon,
        statusString: "singleText".tr,
        selectedStatusAsset: AssetString.selectedSingleIcon,
        userStatus: UserStatus.single,
      ),
      UserStatusModel(
          statusAsset: AssetString.marriedIcon,
          selectedStatusAsset: AssetString.selectedMarriedIcon,
          statusString: "marriedText".tr,
          userStatus: UserStatus.married),
      UserStatusModel(
          statusAsset: Theme.of(context).withKidsIcon,
          selectedStatusAsset: AssetString.selectedWithKidsIcon,
          statusString: "withKidsText".tr,
          userStatus: UserStatus.withKids),
      UserStatusModel(
          statusAsset: AssetString.singleWithKidsIcon,
          selectedStatusAsset: AssetString.selectedSingleWithKidsIcon,
          statusString: "singleWithKidsText".tr,
          userStatus: UserStatus.singleWithKids),
    ];

    selectedUserStatusList = [userStatusList.first];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: widget.isEdit == true
              ? 15.h
              : 30.h + SizeConstant.hightToSkipBackButtonInTabView,bottom: widget.isEdit == true ? 0.h :52.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //?choose your status text
          CommonTextWidget(
            title: "${"chooseYourStatusText".tr} ?",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          //?4 option for status
          Padding(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: userStatusList
                    .map((e) => Flexible(
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: e.userStatus == UserStatus.singleWithKids
                                ? EdgeInsets.zero
                                : EdgeInsets.only(right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,

                              children: [
                                InkWell(
                                  onTap: () {
                                    print("tappp");
                                    if (selectedUserStatusList.contains(e)) {
                                      // selectedUserStatusList = [];
                                    } else {
                                      selectedUserStatusList = [];

                                      selectedUserStatusList.add(e);
                                    }
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 64.h,
                                    width: ((MyFunction.getWidth(context) -
                                            74.w) /
                                        4),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        MyFunction.getBoxShadow(
                                          dx: 0,
                                          dy: 4.sp,
                                          blurRadius: 15.sp,
                                        )
                                      ],
                                      image: DecorationImage(
                                          image: AssetImage(
                                            selectedUserStatusList.contains(e)
                                                ? AssetString
                                                    .selectedStatusBackGroundImage
                                                : Theme.of(context)
                                                    .statusBackGroundImage,
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.0.sp),
                                      child: SvgPicture.asset(
                                        selectedUserStatusList.contains(e)
                                            ? e.selectedStatusAsset
                                            : e.statusAsset,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CommonTextWidget(
                                  title: e.statusString,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  color: Theme.of(context).skipTextColor,
                                )
                              ],
                            ),
                          ),
                        ))
                    .toList()),
          ),
          //?divider
          const CustomDivider(bottomPadding:0),
          Flexible(child: ListView(children: [
            //? 4 option to choose
            selectedUserStatusList.isNotEmpty
                ? Padding(
              padding:  EdgeInsets.only(top: 20.h),
                  child: switchWidgetAccordingStatus(
                  selectedUserStatusList[0].userStatus),
                )
                : Padding(
                  padding:  EdgeInsets.only(top: 20.h),
                  child: CommonStatusBodyWidget(
              title: "addYourSiblingsDetailsText".tr,
              userStatus: UserStatus.single,
              listTitle: "yourSiblingsDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
              dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController: maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
                ),
          ],))

        ],
      ),
    );
  }

  Widget switchWidgetAccordingStatus(UserStatus userStatus) {
    switch (userStatus) {
      case UserStatus.single:
        return CommonStatusBodyWidget(
          title: "addYourSiblingsDetailsText".tr,
          listTitle: "yourSiblingsDetailsText".tr,
          userStatus: userStatus,
          firstNameEditingController:
          firstNameEditingController,
          dateOfBirthEditingController:
          dateOfBirthEditingController,
          relationEditingController: relationEditingController,
          maleEditingController:maleEditingController,
          femaleEditingController: femaleEditingController,
          qualificationEditingController:
          qualificationEditingController,
          image:widget.image,
        );

      case UserStatus.married:
        return Column(
          children: [
            //?wife/husband detail
            CommonStatusBodyWidget(
              title: "addYourWifeDetailsText".tr,
              userStatus: userStatus,
              listTitle: "yourWifeDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
             dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController:maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
            //?sibling detail
            CommonStatusBodyWidget(
              title: "addYourSiblingsDetailsText".tr,
              userStatus: UserStatus.single,
              listTitle: "yourSiblingsDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
              dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController: maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
          ],
        );

      case UserStatus.withKids:
        return Column(
          children: [
            //?wife/husband detail
            CommonStatusBodyWidget(
              title: "addYourWifeDetailsText".tr,
              userStatus: UserStatus.married,
              listTitle: "yourWifeDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
              dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController: maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
            //?kids detail
            CommonStatusBodyWidget(
              title: "addYourKidsDetailsText".tr,
              userStatus: userStatus,
              listTitle: "yourKidsDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
              dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController: maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
            //?sibling detail
            CommonStatusBodyWidget(
              title: "addYourSiblingsDetailsText".tr,
              userStatus: UserStatus.single,
              listTitle: "yourSiblingsDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
              dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController: maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
          ],
        );
      case UserStatus.singleWithKids:
        return Column(
          children: [
            //?kids detail
            CommonStatusBodyWidget(
              title: "addYourKidsDetailsText".tr,
              userStatus: UserStatus.withKids,
              listTitle: "yourKidsDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
              dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController: maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
            //?sibling detail
            CommonStatusBodyWidget(
              title: "addYourSiblingsDetailsText".tr,
              userStatus: userStatus,
              listTitle: "yourSiblingsDetailsText".tr,
              firstNameEditingController:
              firstNameEditingController,
              dateOfBirthEditingController:
              dateOfBirthEditingController,
              relationEditingController: relationEditingController,
              maleEditingController: maleEditingController,
              femaleEditingController: femaleEditingController,
              qualificationEditingController:
              qualificationEditingController,
              image:widget.image,
            ),
          ],
        );

      // default:
      //  return Text('Number Not Found');
    }
  }
}
