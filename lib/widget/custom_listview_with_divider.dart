import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/widget/brif_information_body.dart';
import 'package:sgkks/widget/custom_divider.dart';

class CustomListViewWithDivider extends StatelessWidget {
  const CustomListViewWithDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding:
              EdgeInsets.only(top: 15.h, bottom: 9.h, left: 22.w, right: 22.w),
          child: const BrifInformationBody(),
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
