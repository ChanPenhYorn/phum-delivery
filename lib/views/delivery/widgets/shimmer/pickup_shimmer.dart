import 'package:flutter/material.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/widgets/shimmer/shimmer_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class PickupShimmer extends StatelessWidget {
  const PickupShimmer({super.key});

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
            ShimmerItemWidget(),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ShimmerItemWidget(
                      width: 30,
                      height: 30,
                    ),
                    8.height,
                    ShimmerItemWidget(
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
                16.width,
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerItemWidget(
                          width: 200,
                        ),
                        4.height,
                        ShimmerItemWidget(
                          width: 240,
                        ),
                      ],
                    ),
                    16.height,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerItemWidget(
                          width: 200,
                        ),
                        4.height,
                        ShimmerItemWidget(
                          width: 240,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
