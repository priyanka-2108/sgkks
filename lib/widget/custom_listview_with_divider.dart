import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/widget/brif_information_body.dart';
import 'package:sgkks/widget/custom_divider.dart';

import '../utils/my_enum.dart';

class CustomListViewWithDivider extends StatefulWidget {
  final UserStatus? userStatus;
  final TextEditingController? firstNameEditingController;
  final TextEditingController? dateOfBirthEditingController;
  final TextEditingController? relationEditingController;
  final TextEditingController? maleEditingController;
  final TextEditingController? femaleEditingController;
  final TextEditingController? qualificationEditingController;
  final String? image;

  const CustomListViewWithDivider({
    super.key, this.userStatus, this.firstNameEditingController, this.dateOfBirthEditingController, this.relationEditingController, this.maleEditingController, this.femaleEditingController, this.qualificationEditingController, this.image,
  });

  @override
  State<CustomListViewWithDivider> createState() => _CustomListViewWithDividerState();
}

class _CustomListViewWithDividerState extends State<CustomListViewWithDivider> {

  final List userData=[0,1];
  @override
  void initState() {
    // TODO: implement initState
    print("CustomListViewWithDivider---->${widget.userStatus}");
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: userData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.only(top: 15.h, bottom: 9.h, left: 22.w, right: 22.w),
          child:  BrifInformationBody(userStatus: widget.userStatus,firstNameEditingController: widget.firstNameEditingController,dateOfBirthEditingController:widget.dateOfBirthEditingController,relationEditingController:widget.relationEditingController,maleEditingController:widget.maleEditingController,femaleEditingController:widget.femaleEditingController,qualificationEditingController:widget.qualificationEditingController,image: widget.image,onTap: (){setState(() {
            userData.removeAt(index);
          }); },),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const CustomDivider(
          topPadding: 0,
          bottomPadding: 0,
        );
      },
    );
  }
}
