import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:sgkks/bottomSheet/my_bottom_sheet.dart';
import 'package:sgkks/module/information/components/business_information_widget.dart';
import 'package:sgkks/module/information/components/choose_your_status_widget.dart';
import 'package:sgkks/module/information/components/residential_information.dart';
import 'package:sgkks/module/information/components/sign_up_widget.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:sgkks/widget/common_back_button.dart';
import 'package:sgkks/widget/common_button.dart';

import '../../../utils/theme/theme_manager.dart';

class SetInformationScreen extends StatefulWidget {
  SetInformationScreen({super.key});

  @override
  State<SetInformationScreen> createState() => _SetInformationScreenState();
}

class _SetInformationScreenState extends State<SetInformationScreen>
    with TickerProviderStateMixin {
  final TextEditingController villageEditingController =
      TextEditingController();

  final TextEditingController addressEditingController =
      TextEditingController();

  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(vsync: this, length: 4);
    tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: DefaultTabController(
          length: 4,
          animationDuration: const Duration(microseconds: 100),
          child: Container(
              height: MyFunction.getHight(context),
              width: MyFunction.getWidth(context),
              decoration:
                  MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(22.w, 0.h, 22.w, 50.h),
                  child: Stack(
                    children: [
                      Positioned(
                          top: 30.h, left: 0, child:   CommonBackButton(color:Theme.of(context).backIconColor,
                        boxShadow:(ThemeManager.instance.themeMode == ThemeMode.light)
                            ?[MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.1),
                          blurRadius: 15.0,
                          spreadRadius: 0.0,
                          dx: 0.0, dy : 4.0,),] :  [MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.31),
                          blurRadius: 26.0,
                          spreadRadius: 0.0,
                          dx: 0.0, dy : 1.0,),],),),
                      Column(
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 7.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 7.h,
                                      width: ((MyFunction.getWidth(context) -
                                              44.w) /
                                          4),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).mediumGreyColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft:
                                                  Radius.circular(85.sp),
                                              bottomRight:
                                                  Radius.circular(85.sp))),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: 7.h,
                                decoration: BoxDecoration(
                                    color: CustomColor.transparent,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(85.sp),
                                        bottomRight: Radius.circular(85.sp))),
                                child: TabBar(
                                  controller: tabController,
                                  physics: const BouncingScrollPhysics(),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicator: BoxDecoration(
                                      gradient: MyFunction.getGradColor(),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(85.sp),
                                          bottomRight: Radius.circular(85.sp))),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.black,
                                  tabs: const [
                                    Tab(
                                      text: '',
                                    ),
                                    Tab(
                                      text: '',
                                    ),
                                    Tab(
                                      text: '',
                                    ),
                                    Tab(
                                      text: '',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                              child: TabBarView(
                            controller: tabController,
                            children: [
                              ResidentialInformationWidget(
                                addressEditingController:
                                    addressEditingController,
                                villageEditingController:
                                    villageEditingController,
                              ),
                              BusinessInformationWidget(
                                addressEditingController:
                                    addressEditingController,
                                villageEditingController:
                                    villageEditingController,
                              ),
                              ChooseYourStatusWidget(
                                addressEditingController:
                                    addressEditingController,
                                villageEditingController:
                                    villageEditingController,
                              ),
                              const SignUpWidget(),
                            ],
                          ))
                        ],
                      ),
                      Positioned(
                        bottom: 0.h,
                        left: 28.w,
                        right: 28.w,
                        child: GestureDetector(
                          child: CommonButton(
                              title: tabController?.index == 3
                                  ? "signUpCamelCaseText".tr
                                  : "nextText".tr,
                              // "viewProfileText".tr,
                              onTap: () {
                                MyBottomSheet.showProfileBottomSheet(
                                  context,
                                      () {},
                                );

                                // WillPopScope(onWillPop:(){
                                //   FocusScope.of(context).requestFocus(FocusNode());
                                //   Navigator.of(context).pop();
                                //   return Future.value(false);
                                // },child:  MyBottomSheet.showProfileBottomSheet(
                                //   context,
                                //       () {},
                                // ),);


                                // DefaultTabController.of(context).animateTo(2);
                                // tabController.animateTo(1,
                                //     duration:
                                //         const Duration(milliseconds: 300),
                                //     curve: Curves.easeIn);
                              }),
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
