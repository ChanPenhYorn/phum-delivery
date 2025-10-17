import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItemWidget extends StatelessWidget {
  const ShimmerItemWidget(
      {super.key, this.height, this.width, this.borderRadius});

  final double? height;
  final double? width;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height ?? 15,
        width: width ?? 150,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          color: Colors.white,
        ),
      ),
    );
  }
}
