import 'package:flutter/material.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';
import 'package:phum_delivery/widgets/shimmer/shimmer_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class DeliveryProfileShimmer extends StatelessWidget {
  const DeliveryProfileShimmer({super.key});

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
            Row(
              children: [
                ShimmerItemWidget(
                  width: 40,
                  height: 40,
                  borderRadius: BorderRadius.circular(30),
                ),
                8.width,
                Column(
                  children: [
                    ShimmerItemWidget(),
                    4.height,
                    ShimmerItemWidget(),
                  ],
                ),
              ],
            ),
            16.height,
            AppDeviderWidget(),
            16.height,
            ShimmerItemWidget(
              height: 22,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
