import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phum_delivery/r.dart';

import 'package:phum_delivery/widgets/shimmer/shimmer_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class DeliveryItemShimmer extends StatelessWidget {
  const DeliveryItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: ListTile(
          leading: ClipOval(child: CircleAvatar()),
          title: ShimmerItemWidget(
            width: 100,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              ShimmerItemWidget(),
              const SizedBox(height: 4),
              ShimmerItemWidget(),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShimmerItemWidget(
                    width: 50,
                    height: 25,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(AssetSvg.arrowTop),
                ],
              ),
            ],
          ),
        ));
  }
}
