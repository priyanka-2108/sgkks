import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sgkks/utils/asset_string.dart';
import 'package:sgkks/widget/common_profile_face.dart';

import '../../../utils/custom_color.dart';

class CustomPositionAvatarWidget extends StatefulWidget {
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
  State<CustomPositionAvatarWidget> createState() => _CustomPositionAvatarWidgetState();
}

class _CustomPositionAvatarWidgetState extends State<CustomPositionAvatarWidget> with TickerProviderStateMixin{
  late AnimationController controller ;
  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  @override
  void initState() {
    controller= AnimationController(vsync: this, duration: const Duration(seconds: 5)) ;
    controller.repeat();
    super.initState();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.bottom,
      left: widget.left,
      right: widget.right,
      top: widget.top,
      child: RotationTransition(
        turns:controller,
        child: CommonProfileFace(
          image: AssetString.onboardingAsset,
          radius: widget.radius ?? 25.r,
          borderColor: CustomColor.linearPrimaryColor.withOpacity(0.8),
        ),
      ),
    );
  }
}
