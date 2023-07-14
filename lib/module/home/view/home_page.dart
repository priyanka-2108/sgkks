import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import '../../../widget/common_image_button.dart';
import '../../../widget/common_text.dart';
import '../../announcement/announcement.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  TextEditingController searchEditingController = TextEditingController();
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
  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            decoration: BoxDecoration(
              gradient: MyFunction.blackGrdBackGround(),
              borderRadius: BorderRadius.all(Radius.circular(5.sp)),
            ),
            margin: const EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.sp)),
                child: Image.asset(item, fit: BoxFit.cover, width: 1000.0)),
          ))
      .toList();

  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},

    {'name':'GUJARATI','locale': Locale('gu','IN')},
  ];
  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Text(locale[index]['name']),onTap: (){
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return Divider(
                  color: Colors.blue,
                );
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        extendBody: _tabController?.index == 0 ?true :false,
        resizeToAvoidBottomInset: false,
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Container(
                  height: MyFunction.getHight(context),
                  width: MyFunction.getWidth(context),
                  decoration: MyFunction.imageBackGround(
                      Theme.of(context).onboardingBackGround),
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
                              child: Image.asset(AssetString.logoApp)),

                          Positioned(
                            left: 258.w,
                            top: 35.h,
                            child: CommonImageButton(
                              onTap: () {
                                MyBottomSheet.showFavoriteBottomSheet(context);
                              },
                              image: AssetString.heartIcon,
                            ),
                          ),
                          Positioned(
                            left: 302.w,
                            top: 35.h,
                            child: CommonImageButton(
                              onTap: () {

                              },
                              image: AssetString.notificationImage,
                            ),
                          ),
                        ],
                      ),
                      // search TextField
                      Container(
                        height: 36.h,
                        margin: EdgeInsets.only(
                            left: 22.w, right: 22.w, top: 12.w, bottom: 12.h),
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
                                child: Image.asset(AssetString.searchIcon),
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: 22.w, right: 22.w, bottom: 6.h, top: 15.h),
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
                                Image.asset(AssetString.compileImage),
                              ],
                            ),
                            Text("seeAllText".tr,
                                style: MyFunction.getGradientText(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      //slider
                      SizedBox(
                        height: 235.h,
                        child: ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              CarouselSlider(
                                items: imageSliders,
                                carouselController: _controller,
                                options: CarouselOptions(
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
                      // nearByYou Text
                      Padding(
                        padding: EdgeInsets.only(
                            left: 22.w, right: 22.w, bottom: 6.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(

                                  "nearByYouText".tr,
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18.sp,
                                      color: Theme.of(context).blackColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Image.asset(AssetString.nearByYouImage),
                              ],
                            ),
                            Text(
                              "seeAllText".tr,
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14.sp,
                                  color: CustomColor.linearPrimaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      // all User Gird
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 22.w, right: 22.w, top: 6.h),
                          child: StaggeredGridView.count(
                            crossAxisCount: 4,
                            staggeredTiles: userImgList
                                .map<StaggeredTile>(
                                    (_) => const StaggeredTile.fit(2))
                                .toList(),
                            mainAxisSpacing: 22,
                            crossAxisSpacing: 23,
                            // padding: EdgeInsets.all(4.sp),
                            children: userImgList.map((e) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: MyFunction.blackGrdBackGround(),
                                      boxShadow: [
                                        MyFunction.getBoxShadow(
                                          dx: 0,
                                          dy: 4,
                                          blurRadius: 29,
                                          spreadRadius: 0,
                                          color: CustomColor.shadowColor
                                              .withOpacity(0.1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.sp),
                                      child: Image.asset(
                                        e,
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
                                      child: Image.asset(
                                        AssetString.favoriteImage,
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
                                      color: CustomColor.lightWhiteColor,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10.h,
                                    left: 12.h,
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          AssetString.locationImage,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        CommonTextWidget(
                                          title: "Surat",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColor.lightWhiteColor,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Image.asset(
                                          AssetString.peopleImage,
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        CommonTextWidget(
                                          title: "3",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColor.lightWhiteColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),

                          //     StaggeredGridView.countBuilder(
                          //   crossAxisCount: 4,
                          //   itemCount: 8,
                          //   itemBuilder: (BuildContext context, int index) =>
                          //       Stack(
                          //     children: [
                          //       Container(
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(8.sp),
                          //           image: const DecorationImage(
                          //               image: NetworkImage(
                          //                   "https://i.imgur.com/EVTkpZL.jpg"),
                          //               fit: BoxFit.cover),
                          //         ),
                          //       ),
                          //       Positioned(
                          //         top: 8.h,
                          //         right: 8.w,
                          //         child: CircleAvatar(
                          //           maxRadius: 15,
                          //           backgroundColor: CustomColor.lightWhiteColor
                          //               .withOpacity(0.2),
                          //           child: Image.asset(
                          //             AssetString.favoriteImage,
                          //           ),
                          //         ),
                          //       ),
                          //       Positioned(
                          //         bottom: 28.h,
                          //         left: 8.h,
                          //         child: Text(
                          //           "Robert Fox / 30",
                          //           style: TextStyle(
                          //               fontFamily: 'Roboto',
                          //               fontSize: 14.sp,
                          //               color: CustomColor.lightWhiteColor,
                          //               fontWeight: FontWeight.w500),
                          //         ),
                          //       ),
                          //       Positioned(
                          //         bottom: 10.h,
                          //         left: 8.h,
                          //         child: Row(
                          //           children: [
                          //             Image.asset(
                          //               AssetString.locationImage,
                          //             ),
                          //             SizedBox(
                          //               width: 5.w,
                          //             ),
                          //             Text(
                          //               "Surat",
                          //               style: TextStyle(
                          //                   fontFamily: 'Roboto',
                          //                   fontSize: 12.sp,
                          //                   color: CustomColor.lightWhiteColor,
                          //                   fontWeight: FontWeight.w400),
                          //             ),
                          //             SizedBox(
                          //               width: 5.w,
                          //             ),
                          //             Image.asset(
                          //               AssetString.peopleImage,
                          //             ),
                          //             SizedBox(
                          //               width: 5.w,
                          //             ),
                          //             Text(
                          //               "3",
                          //               style: TextStyle(
                          //                   fontFamily: 'Roboto',
                          //                   fontSize: 12.sp,
                          //                   color: CustomColor.lightWhiteColor,
                          //                   fontWeight: FontWeight.w400),
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   staggeredTileBuilder: (int index) =>
                          //       StaggeredTile.count(2, index.isEven ? 2 : 1),
                          //   mainAxisSpacing: 22,
                          //   crossAxisSpacing: 22,
                          // ),
                        ),
                      ),
                    ],
                  )),
            ),
            const AnnouncementScreen(),
             SettingScreen(),
          ],
        ),

        bottomNavigationBar: menu(),
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
                      child: Image.asset(AssetString.filterImage)),
                ),
              )
            : null,
      ),
    );
  }

  Widget menu() {
    return Container(
      color: Theme.of(context).bottomNavigationBarColor,
      child: Container(
        height: 68.h,

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
          indicatorPadding: const EdgeInsets.all(5.0),
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
                child: _tabController!.index == 0
                    ? selectedTab("homeText".tr, AssetString.homeImage,
                        CustomColor.whiteShadoColor)
                    : unselectedTab(
                        AssetString.homeImage, CustomColor.greyColor)),
            Tab(
                child: _tabController!.index == 1
                    ? selectedTab("announcementText".tr,
                        AssetString.announcementImage, CustomColor.whiteShadoColor)
                    : unselectedTab(
                        AssetString.announcementImage, CustomColor.greyColor)),
            Tab(
                child: _tabController!.index == 2
                    ? selectedTab("settingText".tr, AssetString.settingImage,
                        CustomColor.whiteShadoColor)
                    : unselectedTab(
                        AssetString.settingImage, CustomColor.greyColor)),
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
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: MyFunction.selectedGradBackGround(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      url,
                      color: color,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    SizedBox(
                      width: 32.w,
                      child: CommonTextWidget(
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
            )
          ],
        ),
      ),
    );
  }

  unselectedTab(String url, Color color) {
    return Image.asset(
      url,
      color: color,
    );
  }
}
