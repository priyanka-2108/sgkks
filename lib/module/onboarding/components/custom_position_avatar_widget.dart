import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/widget/common_profile_face.dart';

class CustomPositionAvatarWidget extends StatelessWidget {
  const CustomPositionAvatarWidget({
    super.key,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.radius,
  });
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      right: right,
      top: top,
      child: CommonProfileFace(
        image: AssetString.onboardingAsset,
        radius: radius ?? 25.r,
      ),
    );
  }
}
