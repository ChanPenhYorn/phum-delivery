import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_entity.dart';
import 'package:phum_delivery/r.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';

class PickupCardWidget extends StatelessWidget {
  const PickupCardWidget({super.key, required this.pickup});

  final PickupEntity pickup;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Take your pickup at: ',
                style: AppFont.medium(
                    fontSize: 14, color: AppColors.ligthBaseNew)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      AssetSvg.location,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        Colors.green,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      height: 28, // Height of the dotted line
                      child: DottedLine(
                        direction: Axis.vertical,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashGapLength: 4.0,
                        dashColor: AppColors.ligthBaseNew,
                      ),
                    ),
                    SizedBox(height: 4),
                    SvgPicture.asset(
                      AssetSvg.location,
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildUserProcessing(
                          name: pickup.storeName, address: pickup.storeAddress),
                      const SizedBox(height: 12),
                      buildUserProcessing(
                          name: pickup.customName,
                          address: pickup.customAddress),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppDeviderWidget(
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                    DateFormat('EEEE, dd MMM yyyy')
                        .format(DateTime.parse(pickup.date)),
                    style:
                        AppFont.semiBold(fontSize: 16, color: AppColors.black)),
                const Spacer(),
                Text(
                    '${DateFormat('mm').format(DateTime.parse(pickup.date))} mins (esitimated)',
                    style: AppFont.regular(
                        fontSize: 14, color: AppColors.ligthBaseNew)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(
                  AssetSvg.location,
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.ligthBaseNew,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                Text('${pickup.distance} from your location',
                    style: AppFont.regular(
                        fontSize: 14, color: AppColors.ligthBaseNew)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Column buildUserProcessing({required String name, required String address}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Text(name,
                style: AppFont.semiBold(fontSize: 16, color: AppColors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
          ),
          SvgPicture.asset(
            AssetSvg.arrowTop,
            width: 20,
            height: 20,
          ),
        ],
      ),
      Text(address,
          style: AppFont.regular(
            fontSize: 14,
            color: AppColors.ligthBaseNew,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1),
    ],
  );
}
