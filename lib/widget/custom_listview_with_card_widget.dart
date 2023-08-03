import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_enum.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/brif_information_body.dart';

class CustomListViewWithCardWidget extends StatefulWidget {
  final UserStatus? userStatus;
  final TextEditingController? firstNameEditingController;
  final TextEditingController? dateOfBirthEditingController;
  final TextEditingController? relationEditingController;
  final TextEditingController? maleEditingController;
  final TextEditingController? femaleEditingController;
  final TextEditingController? qualificationEditingController;
  final String? image;
  final  Function()? onTap;

  const CustomListViewWithCardWidget({
    super.key, this.userStatus, this.firstNameEditingController, this.dateOfBirthEditingController, this.relationEditingController, this.maleEditingController, this.femaleEditingController, this.qualificationEditingController, this.image, this.onTap,
  });

  @override
  State<CustomListViewWithCardWidget> createState() => _CustomListViewWithCardWidgetState();
}

class _CustomListViewWithCardWidgetState extends State<CustomListViewWithCardWidget> {

  final List userData=[0,1];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("CustomListViewWithCardWidget---->${widget.userStatus}");
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount:  userData.length,
      itemBuilder: (context, index) {
        return Container(
            margin: EdgeInsets.only(bottom: 15.h, left: 2.w, right: 2.w),
            width: MyFunction.getWidth(context) - 40.w,
            padding: EdgeInsets.all(0.5.sp),
            decoration: BoxDecoration(
              color: Theme.of(context).boxBackColor,
              borderRadius: BorderRadius.circular(8.sp),
              boxShadow: [
                MyFunction.getBoxShadow(
                    dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.h),
              child:  BrifInformationBody(userStatus: widget.userStatus,firstNameEditingController: widget.firstNameEditingController,dateOfBirthEditingController:widget.dateOfBirthEditingController,relationEditingController:widget.relationEditingController,maleEditingController:widget.maleEditingController,femaleEditingController:widget.femaleEditingController,qualificationEditingController:widget.qualificationEditingController,image: widget.image,onTap: (){setState(() {
                userData.removeAt(index);
              }); },),
            ));
      },
    );
  }
}
