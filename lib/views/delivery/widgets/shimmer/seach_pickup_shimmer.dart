import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/widgets/shimmer/shimmer_item_widget.dart';
import 'package:shimmer/shimmer.dart';

class SearchPickupShimmerWidget extends StatelessWidget {
  const SearchPickupShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          16.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ShimmerItemWidget(),
          ),
          16.height,
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: ListTile(
                        titleAlignment: ListTileTitleAlignment.top,
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
                        trailing: SvgPicture.asset(AssetSvg.arrowTop),
                      )));
            },
          ),
        ],
      ),
    );
  }
}
