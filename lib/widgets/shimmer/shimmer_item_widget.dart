import 'package:flutter/material.dart';

class ShimmerItemWidget extends StatelessWidget {
  const ShimmerItemWidget(
      {super.key, this.height, this.width, this.borderRadius});

  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 15,
      width: width ?? 150,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        color: Colors.white,
      ),
    );
  }
}
