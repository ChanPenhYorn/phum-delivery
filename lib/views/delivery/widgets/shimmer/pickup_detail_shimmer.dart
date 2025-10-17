import 'package:flutter/material.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';
import 'package:phum_delivery/widgets/shimmer/shimmer_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class PickupDetailShimmer extends StatelessWidget {
  const PickupDetailShimmer({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerItemWidget(),
                16.width,
                ShimmerItemWidget(),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerItemWidget(
                  width: 64,
                  height: 64,
                ),
                16.width,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ShimmerItemWidget(),
                              8.width,
                              ShimmerItemWidget(
                                width: 15,
                              ),
                            ],
                          ),
                          4.height,
                          ShimmerItemWidget(),
                        ],
                      ),
                      16.height,
                      AppDeviderWidget(),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerItemWidget(),
                              4.height,
                              ShimmerItemWidget(),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerItemWidget(
                                width: 40,
                              ),
                              4.height,
                              ShimmerItemWidget(
                                width: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            16.height,
            AppDeviderWidget(),
            16.height,
            ShimmerItemWidget(),
            4.height,
            ShimmerItemWidget(
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
