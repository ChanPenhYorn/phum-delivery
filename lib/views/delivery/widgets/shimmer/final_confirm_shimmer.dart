import 'package:flutter/material.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';
import 'package:phum_delivery/widgets/shimmer/shimmer_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class FinalConfirmShimmer extends StatelessWidget {
  const FinalConfirmShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildLine(),
            4.height,
            buildLine(lableWidth: 220),
            16.height,
            AppDeviderWidget(),
            16.height,
            buildLine(),
            4.height,
            buildLine(lableWidth: 220)
          ],
        ),
      ),
    );
  }

  Row buildLine({double? lableWidth, double? valueWidth}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerItemWidget(
          width: lableWidth ?? 200,
        ),
        16.width,
        ShimmerItemWidget(
          width: valueWidth ?? 50,
        ),
      ],
    );
  }
}
