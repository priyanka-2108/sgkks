import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sgkks/module/setting/setting.dart';
import 'package:sgkks/utils/my_function.dart';
import 'package:sgkks/utils/my_string.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import '../../../bottomSheet/my_bottom_sheet.dart';
import '../../../utils/asset_string.dart';
import '../../../utils/custom_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../widget/common_icon_button.dart';
import '../../../widget/common_image_button.dart';
import '../../../widget/common_text.dart';
import '../../announcement/announcement.dart';
import '../../samaj_bhavan/samaj_bhavan.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  TextEditingController searchEditingController = TextEditingController();
  final TextEditingController reasonForTestController = TextEditingController();
  TabController? _tabController;
  static final List<String> imgList = [
    AssetString.sliderImage1,
    AssetString.sliderImage1,
    AssetString.sliderImage1,
    AssetString.sliderImage1,
  ];
  final List userImgList = [
    AssetString.sliderImage1,
    AssetString.userDetail2,
    AssetString.userDetail2,
    AssetString.sliderImage1,
    AssetString.sliderImage1,
  ];

  List<Widget> imageSliders = [];
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'GUJARATI', 'locale': const Locale('gu', 'IN')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    imageSliders = imgList
        .map((item) => GestureDetector(
              onTap: () {
                MyFunction.replaceScreen(context, '/announcementDetail');
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: MyFunction.blackGrdBackGround(),
                  borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                ),
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)),
              ),
            ))
        .toList();
    _tabController = TabController(vsync: this, length: 4);
    _tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: WillPopScope(
        onWillPop: () {
          if (_tabController?.index == 0) {
            SystemNavigator.pop();
          } else if (_tabController?.index == 1) {
            setState(() {
              _tabController?.index = 0;
            });
          } else {
            setState(() {
              _tabController?.index = 0;
            });
          }

          return Future.value(false);
        },
        child: Scaffold(
          extendBody: _tabController?.index == 0 ? true : false,
          resizeToAvoidBottomInset: false,
          body: TabBarView(
            controller: _tabController,
            children: [
              Container(
                  height: MyFunction.getHight(context),
                  width: MyFunction.getWidth(context),
                  decoration: MyFunction.imageBackGround(
                      Theme.of(context).onboardingBackGround),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            // title Text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 40.h),
                                  child: Text(
                                    "sgkksText".tr,
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 25.sp,
                                        color: Theme.of(context).secondaryColor,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 22.w, top: 35.h, bottom: 22.h),
                                child: SvgPicture.asset(AssetString.logoAppSvg)),

                            // Positioned(
                            //   left: 258.w,
                            //   top: 35.h,
                            //   child: CommonImageButton(
                            //     onTap: () {
                            //       MyBottomSheet.showFavoriteBottomSheet(context);
                            //     },
                            //     image: AssetString.heartIcon,
                            //   ),
                            // ),
                            Positioned(
                              right: 22.w,
                              top: 35.h,
                              child: Row(
                                children: [
                                  CommonImageButton(
                                    onTap: () {
                                      MyBottomSheet.showFavoriteBottomSheet(
                                          context, reasonForTestController);
                                    },
                                    isSvgIcon: true,
                                    image: AssetString.heartIconSvg,
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  CommonImageButton(
                                    onTap: () {
                                      MyFunction.replaceScreen(
                                          context, "/notification");
                                    },
                                    isSvgIcon: true,
                                    image: AssetString.notificationImageSvg,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // search TextField
                        Container(
                          height: 36.h,
                          margin: EdgeInsets.only(
                              left: 22.w, right: 22.w, top: 12.w, bottom: 0.h),
                          padding: EdgeInsets.all(0.5.sp),
                          decoration: BoxDecoration(
                            color: Theme.of(context).whiteSearchColor,
                            boxShadow: [
                              MyFunction.getBoxShadow(
                                  dx: 0, dy: 4, blurRadius: 15, spreadRadius: 0)
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child:
                                      SvgPicture.asset(AssetString.searchIconSvg),
                                ),
                                prefixIconConstraints: const BoxConstraints(),
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                hintText: "enterSearchText".tr,
                                hintStyle: TextStyle(
                                  color: CustomColor.greyColor,
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                          ),
                        ),
                        //popular News
                        Flexible(
                          child: ListView(physics: const ScrollPhysics(), children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 22.w,
                                  right: 22.w,
                                  bottom: 6.h,
                                  top: 15.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "popularNewsText".tr,
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 18.sp,
                                            color: Theme.of(context).blackColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      SvgPicture.asset(
                                          AssetString.compileImageSvg),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _tabController!.index = 1;
                                    },
                                    child: Text("seeAllText".tr,
                                        style: MyFunction.getGradientText(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                            CarouselSlider(
                              items: imageSliders,
                              carouselController: _controller,
                              options: CarouselOptions(
                                  autoPlayInterval: const Duration(seconds: 2),

                                  // height: 150,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 2.0,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  }),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List<Widget>.generate(
                                imgList.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(
                                      left: 5.h, right: 5.h, top: 7.h),
                                  child: Container(
                                      height: 6.h,
                                      width: _current == index ? 21.14.w : 6.w,
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
                            // nearByYou Text
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 22.w,
                                  right: 22.w,
                                  bottom: 6.h,
                                  top: 22.h),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Flexible(
                                    child: Text(
                                      "nearByYouText".tr,


                                      style: TextStyle(

                                          fontFamily: 'Roboto',
                                          fontSize: 18.sp,
                                          color: Theme.of(context).blackColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  SvgPicture.asset(
                                      AssetString.nearByYouImageSvg),
                                  // GestureDetector(
                                  //   onTap: (){
                                  //
                                  //     _tabController!.index=1;
                                  //
                                  //   },
                                  //   child: Text(
                                  //     "seeAllText".tr,
                                  //     style: TextStyle(
                                  //         fontFamily: 'Roboto',
                                  //         fontSize: 14.sp,
                                  //         color: CustomColor.linearPrimaryColor,
                                  //         fontWeight: FontWeight.w400),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            // all User Gird
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 22.w,
                                  right: 22.w,
                                  top: 6.h,
                                  bottom: 22.h),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: userImgList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2/2,
                                          mainAxisSpacing: 22,
                                          crossAxisSpacing: 23,

                                      ),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        MyBottomSheet
                                            .showUserProfileBottomSheet(
                                                context,
                                                reasonForTestController);
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            width:double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              gradient: MyFunction
                                                  .blackGrdBackGround(),
                                              boxShadow: [
                                                MyFunction.getBoxShadow(
                                                  dx: 0,
                                                  dy: 4,
                                                  blurRadius: 29,
                                                  spreadRadius: 0,
                                                  color: CustomColor
                                                      .shadowColor
                                                      .withOpacity(0.1),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.sp),
                                              child: Image.asset(
                                                userImgList[index],
                                                 fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 8.h,
                                            right: 8.w,
                                            child: CircleAvatar(
                                              maxRadius: 15,
                                              backgroundColor: CustomColor
                                                  .lightWhiteColor
                                                  .withOpacity(0.2),
                                              child: SvgPicture.asset(
                                                AssetString.favoriteImageSvg,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 28.h,
                                            left: 12.h,
                                            child: CommonTextWidget(
                                              title: "Robert Fox / 30",
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  CustomColor.lightWhiteColor,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10.h,
                                            left: 12.h,
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(
                                                  AssetString
                                                      .locationImageSvg,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                CommonTextWidget(
                                                  title: "Surat",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomColor
                                                      .lightWhiteColor,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                SvgPicture.asset(
                                                  AssetString.peopleImageSvg,
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                CommonTextWidget(
                                                  title: "3",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomColor
                                                      .lightWhiteColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            // StaggeredGridView.count(
                            //   crossAxisCount: 4,
                            //   staggeredTiles: userImgList
                            //       .map<StaggeredTile>(
                            //           (_) => const StaggeredTile.fit(2))
                            //       .toList(),
                            //   mainAxisSpacing: 22,
                            //   crossAxisSpacing: 23,
                            //   // padding: EdgeInsets.all(4.sp),
                            //   children: userImgList.map((e) {
                            //     return Stack(
                            //       children: [
                            //         Container(
                            //           decoration: BoxDecoration(
                            //             gradient: MyFunction.blackGrdBackGround(),
                            //             boxShadow: [
                            //               MyFunction.getBoxShadow(
                            //                 dx: 0,
                            //                 dy: 4,
                            //                 blurRadius: 29,
                            //                 spreadRadius: 0,
                            //                 color: CustomColor.shadowColor
                            //                     .withOpacity(0.1),
                            //               )
                            //             ],
                            //             borderRadius: BorderRadius.circular(8.sp),
                            //           ),
                            //           child: ClipRRect(
                            //             borderRadius: BorderRadius.circular(8.sp),
                            //             child: Image.asset(
                            //               e,
                            //             ),
                            //           ),
                            //         ),
                            //         Positioned(
                            //           top: 8.h,
                            //           right: 8.w,
                            //           child: CircleAvatar(
                            //             maxRadius: 15,
                            //             backgroundColor: CustomColor
                            //                 .lightWhiteColor
                            //                 .withOpacity(0.2),
                            //             child: Image.asset(
                            //               AssetString.favoriteImage,
                            //             ),
                            //           ),
                            //         ),
                            //         Positioned(
                            //           bottom: 28.h,
                            //           left: 12.h,
                            //           child: CommonTextWidget(
                            //             title: "Robert Fox / 30",
                            //             fontSize: 14.sp,
                            //             fontWeight: FontWeight.w500,
                            //             color: CustomColor.lightWhiteColor,
                            //           ),
                            //         ),
                            //         Positioned(
                            //           bottom: 10.h,
                            //           left: 12.h,
                            //           child: Row(
                            //             children: [
                            //               Image.asset(
                            //                 AssetString.locationImage,
                            //               ),
                            //               SizedBox(
                            //                 width: 5.w,
                            //               ),
                            //               CommonTextWidget(
                            //                 title: "Surat",
                            //                 fontSize: 12.sp,
                            //                 fontWeight: FontWeight.w400,
                            //                 color: CustomColor.lightWhiteColor,
                            //               ),
                            //               SizedBox(
                            //                 width: 5.w,
                            //               ),
                            //               Image.asset(
                            //                 AssetString.peopleImage,
                            //               ),
                            //               SizedBox(
                            //                 width: 5.w,
                            //               ),
                            //               CommonTextWidget(
                            //                 title: "3",
                            //                 fontSize: 12.sp,
                            //                 fontWeight: FontWeight.w400,
                            //                 color: CustomColor.lightWhiteColor,
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     );
                            //   }).toList(),
                            // ),

                            // DotsIndicator(
                            //   dotsCount: imgList.length,
                            //   position: _current.toDouble(),
                            //   decorator: DotsDecorator(
                            //     size:  Size.square(6.sp),
                            //     activeSize: Size(21.14.w, 6.h),
                            //
                            //     activeShape: RoundedRectangleBorder(
                            //
                            //         borderRadius: BorderRadius.circular(50.sp)),
                            //     color: CustomColor.whiteDotColor,
                            //     activeColor: CustomColor.linearPrimaryColor,
                            //   ),
                            // ),
                          ]),
                        ),
                      ],
                    ),
                  )),
              const AnnouncementScreen(),

              const SamajBhavanScreen(),
              const SettingScreen(),
            ],
          ),

          bottomNavigationBar:menu(),
          floatingActionButton: _tabController!.index == 0
              ? InkWell(
                  onTap: () {
                    MyFunction.replaceScreen(context, "/filter");
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 21.h),
                    child: Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                            gradient: MyFunction.selectedGradBackGround(),
                            borderRadius: BorderRadius.circular(8.sp)),
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child:
                                SvgPicture.asset(AssetString.filterImageSvg))),
                  ),
                )
              : null,
        ),
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Theme.of(context).bottomNavigationBarColor,
      child: Container(
        height: 68.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarColor,
            boxShadow: [
              MyFunction.getBoxShadow(
                dx: 0,
                dy: 0,
                blurRadius: 8,
                spreadRadius: 0,
                color: CustomColor.shadowColor.withOpacity(0.13),
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.sp),
                topRight: Radius.circular(15.sp))),
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          // indicatorPadding: const EdgeInsets.all(5.0),
          indicatorColor: Colors.transparent,
          isScrollable: true,
          padding: EdgeInsets.only(left: 20.w,right: 20.w),

          labelPadding:  EdgeInsets.only(left: 20.w,right: 20.w),


          tabs: [

            Tab(
                child: _tabController!.index == 0
                    ? selectedTab("homeText".tr, AssetString.homeImageSvg,
                        CustomColor.whiteShadoColor)
                    : unselectedTab(
                        AssetString.homeImageSvg, CustomColor.greyColor)),
            Tab(
                child: _tabController!.index == 1
                    ? selectedTab(
                        "announcementText".tr,
                        AssetString.announcementImageSvg,
                        CustomColor.whiteShadoColor)
                    : unselectedTab(AssetString.announcementImageSvg,
                        CustomColor.greyColor)),
            Tab(
                child: _tabController!.index == 2
                    ? selectedTab("samajBhavanText".tr, AssetString.samajBhavanImageSvg,
                    CustomColor.whiteShadoColor)
                    : unselectedTab(
                    AssetString.samajBhavanImageSvg, CustomColor.greyColor)),
            Tab(
                child: _tabController!.index == 3
                    ? selectedTab("settingText".tr, AssetString.settingImageSvg,
                        CustomColor.whiteShadoColor)
                    : unselectedTab(
                        AssetString.settingImageSvg, CustomColor.greyColor)),

          ],
        ),
      ),
    );
  }

  selectedTab(String text, String url, Color color) {
    return ClipRRect(

      borderRadius: BorderRadius.circular(10.sp),
      child: SizedBox(
        height: 40.h,
        width: 110.w,
        child: Container(

          decoration: BoxDecoration(
            gradient: MyFunction.selectedGradBackGround(),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.center,



              children: [
                Center(
                  child: SvgPicture.asset(
                    url,
                    color: color,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Flexible(
                  child: CommonTextWidget(
textAlign: TextAlign.center,
                    title: text,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.lightWhiteColor,
                    fontFamily: 'Roboto',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  unselectedTab(String url, Color color) {
    return SvgPicture.asset(
      url,
      color: color,
    );
  }
}
