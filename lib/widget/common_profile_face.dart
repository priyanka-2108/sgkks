import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/custom_color.dart';

class CommonProfileFace extends StatelessWidget {
  const CommonProfileFace(
      {super.key,
      required this.image,
      required this.radius,
      this.isBorder = true,
      this.color,
      this.child,
      this.borderColor,
      this.width});
  final String image;
  final double? radius;
  final bool isBorder;
  final Color? color;
  final Widget? child;
  final Color? borderColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: child != null
              ? CustomColor.transparent
              : borderColor ?? Theme.of(context).secondaryColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: isBorder ? EdgeInsets.all(width ?? 1.5.sp) : EdgeInsets.zero,
          child: CircleAvatar(
            backgroundColor: child != null
                ? CustomColor.transparent
                : borderColor ?? Theme.of(context).secondaryColor,
            radius: radius ?? 12.r,
            backgroundImage: child != null ? null : AssetImage(image),
            child: child,
          ),
        ),
      ),
    );
  }
}
