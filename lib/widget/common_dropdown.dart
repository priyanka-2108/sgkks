import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/asset_string.dart';
import '../utils/custom_color.dart';
import '../utils/my_function.dart';
import '../utils/my_string.dart';
import '../utils/theme/theme_manager.dart';
import 'common_text.dart';

class CommonDropDown extends StatefulWidget {
  const CommonDropDown(
      {super.key,
      this.controller,
      required this.text,
      required this.menuStateChange,
      required this.labelText,
      required this.items,
      this.width,
      this.isSearch,
      this.menuHeight,
      this.type, this.color, });
  final TextEditingController? controller;
  final String text;
  final Function(bool) menuStateChange;
  final List<String> items;
  final String labelText;
  final double? width;
  final bool? isSearch;
  final double? menuHeight;
  final String? type;
  final Color? color;

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  String? selectedValue;
  bool isMenuOpen = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title Text
        Padding(
          padding: EdgeInsets.only(bottom: 13.h),
          child: CommonTextWidget(
              title: widget.labelText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,color:widget.color,),
        ),
        //dropdown
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            selectedItemBuilder: widget.isSearch == true
                ? (BuildContext context) {
                    return widget.items.map((String value) {
                      return Row(
                        children: [
                          Image.asset(widget.type == 'residential'
                              ? AssetString.locationIcon
                              : widget.type == 'relation'
                                  ? AssetString.peopleIcon
                                  : AssetString.awardIcon),
                          SizedBox(
                            width: 7.w,
                          ),
                          SizedBox(
                            width: ((MyFunction.getWidth(context) - 58.w) / 4),
                            child: CommonTextWidget(
                              title: value,
                              fontSize: 14.sp,
                              color: CustomColor.darkGreyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      );
                    }).toList();
                  }
                : null,
            dropdownSearchData: widget.isSearch != true
                ? DropdownSearchData(
                    searchInnerWidgetHeight: 22.h,
                    searchController: widget.controller,
                    searchInnerWidget: SizedBox(
                      height: 65.h,
                      child: Container(
                        margin: EdgeInsets.all(14.h),
                        child: TextField(
                          controller: widget.controller,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: CustomColor.darkGreyColor,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: CustomColor.greyColor.withOpacity(0.2),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomColor.linearPrimaryColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            contentPadding: EdgeInsets.only(left: 10.sp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            constraints: const BoxConstraints(),
                            prefixIcon: Image.asset(
                              AssetString.searchIcon,
                            ),
                            hintText: "searchText".tr,
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                              color: CustomColor.darkGreyColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (a, searchValue) {
                      return a.value
                          .toString()
                          .toLowerCase()
                          .contains(searchValue);
                    },
                  )
                : null,
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                widget.controller?.clear();
              }
              setState(() {
                isMenuOpen = isOpen;
              });
            },
            hint: Row(
              children: [
                if (widget.isSearch != true) ...[
                  Expanded(
                    child: CommonTextWidget(
                      title: widget.text,
                      fontSize: 14.sp,
                      color: CustomColor.darkGreyColor,
                      fontWeight: FontWeight.w400,
                      fontFamily:
                          widget.isSearch == true ? 'Roboto' : 'Poppins',
                    ),
                  )
                ] else ...[
                  Image.asset(widget.type == 'residential'
                      ? AssetString.locationIcon
                      : widget.type == 'relation'
                          ? AssetString.peopleIcon
                          : AssetString.awardIcon),
                  SizedBox(
                    width: 7.w,
                  ),
                  CommonTextWidget(
                    title: widget.text,
                    fontSize: 14.sp,
                    color: CustomColor.darkGreyColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: widget.isSearch == true ? 'Roboto' : 'Poppins',
                  ),
                ]
              ],
            ),
            items: widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: widget.isSearch == true
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(widget.type == 'residential'
                                  ? AssetString.locationIcon
                                  : widget.type == 'relation'
                                      ? AssetString.peopleIcon
                                      : AssetString.awardIcon),
                              SizedBox(
                                width: 7.w,
                              ),
                              SizedBox(
                                width:
                                    ((MyFunction.getWidth(context) - 58.w) / 4),
                                child: CommonTextWidget(
                                  title: item,
                                  fontSize: 14.sp,
                                  color: CustomColor.darkGreyColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          if (item != widget.items.last) ...[
                            SizedBox(
                              height: 7.h,
                            ),
                            Divider(
                              color: CustomColor.greyColor.withOpacity(0.2),
                              height: 0.5.h,
                            )
                          ],
                        ],
                      )
                    : CommonTextWidget(
                        title: item,
                        fontSize: 14.sp,
                        color: CustomColor.darkGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
              );
            }).toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 45.h,
              width: widget.width ?? 316.w,
              padding: EdgeInsets.only(
                left: 14.w,
                right: 14.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(
                  color: CustomColor.linearSecondaryColor.withOpacity(0.2),
                ),
                color: Theme.of(context).lightWhiteShadeColor,
                boxShadow: [
                  MyFunction.getBoxShadow(
                      dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
                ],
              ),
              elevation: 2,
            ),
            iconStyleData: IconStyleData(
              icon: isMenuOpen != true
                  ? Image.asset(AssetString.dropDownIcon,color: (ThemeManager.instance.themeMode == ThemeMode.light)?null: CustomColor.whiteShadoColor,)
                  : Image.asset(AssetString.upWordIcon,color:(ThemeManager.instance.themeMode == ThemeMode.light)?null:  CustomColor.whiteShadoColor,),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: widget.width ?? 316.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                border: Border.all(
                  color: CustomColor.linearSecondaryColor.withOpacity(0.2),
                ),
                color: Theme.of(context).lightWhiteShadeColor,
                boxShadow: [
                  MyFunction.getBoxShadow(
                      dx: 0, dy: 0, blurRadius: 25, spreadRadius: 1.0)
                ],
              ),
              offset: const Offset(0, -5),
              scrollbarTheme: ScrollbarThemeData(
                  crossAxisMargin: 12.h,
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all<double>(6.w),
                  thumbVisibility: MaterialStateProperty.all<bool>(true),
                  thumbColor: MaterialStateProperty.all(CustomColor.greyColor)),
            ),
            menuItemStyleData: MenuItemStyleData(
              customHeights: widget.items
                  .map(
                    (e) => (e == widget.items.last)
                        ? 24.h
                        : widget.menuHeight ?? 30.h,
                  )
                  .toList(),
              padding: EdgeInsets.only(left: 14.w, right: 14.w, bottom: 0.h),
            ),
          ),
        ),
      ],
    );
  }
}
