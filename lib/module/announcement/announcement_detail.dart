import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/utils/custom_color.dart';
import '../../bottomSheet/my_bottom_sheet.dart';
import '../../utils/my_function.dart';
import '../../utils/my_string.dart';
import '../../utils/theme/theme_manager.dart';
import '../../widget/common_back_button.dart';
import '../../widget/common_icon_button.dart';
import '../../widget/common_image_button.dart';
import '../../widget/common_text.dart';
import 'package:share_plus/share_plus.dart';

class AnnouncementDetailScreen extends StatefulWidget {
  const AnnouncementDetailScreen({super.key});

  @override
  State<AnnouncementDetailScreen> createState() =>
      _AnnouncementDetailScreenState();
}

class _AnnouncementDetailScreenState extends State<AnnouncementDetailScreen> {
  int _current = 0;
  final TextEditingController reasonForTestController = TextEditingController();
  static final List<String> imgList = [
    AssetString.sliderImage1,
    AssetString.sliderImage1,
    AssetString.sliderImage1,
    AssetString.sliderImage1,
  ];
  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          width: double.infinity,
          decoration: BoxDecoration(

           boxShadow: [
             MyFunction.getBoxShadow(
                 dx: 0,
                 dy: 4,
                 blurRadius: 8,
                 spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1),),
           ] ,
            borderRadius: BorderRadius.all(Radius.circular(16.sp),),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(16.sp),),
            child: Image.asset(
              AssetString.userDetail2,
              fit: BoxFit.cover,
            ),
          ),
        ),
      )
      .toList();
  final CarouselController _controller = CarouselController();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(22.w, 35.h, 22.w, 35.h),
        height: MyFunction.getHight(context),
        width: MyFunction.getWidth(context),
        decoration:
            MyFunction.imageBackGround(Theme.of(context).onboardingBackGround),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // add Announcement Text
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: CommonTextWidget(
                        title: "announcementText".tr,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  //?back button
                  CommonBackButton(color:Theme.of(context).backIconColor,
                    boxShadow:(ThemeManager.instance.themeMode == ThemeMode.light)
                        ?[MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.1),
                      blurRadius: 15.0,
                      spreadRadius: 0.0,
                      dx: 0.0, dy : 4.0,),] :  [MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.31),
                      blurRadius: 26.0,
                      spreadRadius: 0.0,
                      dx: 0.0, dy : 1.0,),],),


                  Positioned(
                    right: 2.w,

                    child: Row(
                      children: [
                        commonIconButton(
                          color:Theme.of(context).iconBackColor,
                          boxShadow:[MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.1),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            dx: 0.0, dy : 4.0,),],
                          onTap: () {
                            MyBottomSheet.reportBottomSheet(context,reasonForTestController);
                          },
                          icon: Icons.error,
                          size: 22,


                        ),

                        SizedBox(width: 15.w,),
                        commonIconButton(
                          color:Theme.of(context).iconBackColor,
                          boxShadow:[MyFunction.getBoxShadow(  color: CustomColor.shadowColor.withOpacity(0.1),
                            blurRadius: 15.0,
                            spreadRadius: 0.0,
                            dx: 0.0, dy : 4.0,),],
                          onTap: () async {
                            Share.share('hey! check out this new app https://play.google.com/store/search?q=pub%3ADivTag&c=apps', subject: 'DivTag Apps Link');

                          },
                          icon: Icons.share,
                          size: 22,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //?image

              Expanded(

                child: ListView(children: [
                  Padding(
                    padding:  EdgeInsets.only(top:19.0.h),
                    child: CarouselSlider(

                      items: imageSliders,
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval:const Duration(seconds: 2) ,
                          height: 248.h,
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:10.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        imgList.length,
                            (index) => Padding(
                          padding:
                          EdgeInsets.only(left: 5.h,right: 5.h,top: 7.h),
                          child: Container(
                              height: 6.h,
                              width:
                              _current == index ? 21.14.w : 6.w,
                              decoration: BoxDecoration(
                                  color: _current == index
                                      ? null
                                      : Theme.of(context).whiteDotColor,
                                  shape: _current == index
                                      ? BoxShape.rectangle
                                      : BoxShape.circle,
                                  borderRadius: _current == index
                                      ? BorderRadius.circular(50.sp)
                                      : null,
                                  gradient: _current == index
                                      ? MyFunction.getGradColor()
                                      : null)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Container(
                                height: 25.h,
                                width: 25.h,
                                decoration: BoxDecoration(
                                  color: CustomColor.whiteShadoColor,
                                  boxShadow: [
                                    MyFunction.getBoxShadow(
                                      dx: 0,
                                      dy: 4,
                                      blurRadius: 15,
                                      spreadRadius: 0,color: CustomColor.shadowColor.withOpacity(0.1),),
                                  ],
                                ),
                                child: Image.asset(
                                  AssetString.sliderImage1,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.w),
                              child: CommonTextWidget(
                                title: "${"postedText".tr}Jone Smith",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color:  Theme.of(context).blueTextColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [

                                SvgPicture.asset(
                                  AssetString.clockImage,
                                  height: 15.h,
                                  width: 15.h,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 58.w,
                                  child: Wrap(
                                    children: [
                                      Text(
                                        "10 min ago",
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 10.sp,
                                            color: CustomColor.greyColor,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 17.w,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetString.calenderImage,
                                  height: 15.h,
                                  width: 15.h,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 70.w,
                                  child: Wrap(
                                    children: [
                                      CommonTextStleWidget(
                                        title: "23 March, 2023",
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                        color: CustomColor.greyColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CommonTextStleWidget(
                      title:
                      "2023 Tata Harrier, Safari Bookings Open; First Tata SUVs To Get ADAS Function",
                      height: 1.5.h,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).blackColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CommonTextStleWidget(
                      title:
                      "aboutText1".tr,
                      letterSpacing: 0.5,
                      height: 1.5.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: CustomColor.greyColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: CommonTextStleWidget(
                      title:
                      "aboutText2".tr,
                      height: 1.5.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: CustomColor.greyColor,
                    ),
                  ),
                  // DotsIndicator(
                  //   dotsCount: imgList.length,
                  //   position: _current.toDouble(),
                  //   decorator: DotsDecorator(
                  //     size:  Size.square(6.sp),
                  //     activeSize: Size(21.14.w, 6.h),
                  //
                  //     activeShape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(50.sp),),
                  //     color: CustomColor.whiteDotColor,
                  //     activeColor: CustomColor.linearPrimaryColor,
                  //   ),
                  // ),
                ]),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
