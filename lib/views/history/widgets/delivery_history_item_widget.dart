import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/core/utils/app_formatter.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/r.dart';

class DeliveryHistoryItemWidget extends StatelessWidget {
  const DeliveryHistoryItemWidget({
    super.key,
    required this.item,
    required this.onTap,
  });
  final DeliveryItemEntity item;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: SvgPicture.asset(item.image, width: 40, height: 40),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: item.status == "Confirm"
                  ? AppColors.lightBaseSecondary
                  : AppColors.basePrimary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              item.status,
              style: AppFont.semiBold(
                  fontSize: 12,
                  color: item.status == "Confirm"
                      ? AppColors.baseSecondary
                      : AppColors.red),
            ),
          ),
        ],
      ),
      // titleAlignment: ListTileTitleAlignment.top,

      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${item.total} items",
              style: AppFont.regular(fontSize: 16, color: AppColors.black)),
          Text(AppFormatter.formatDateTime(item.createdAt),
              style:
                  AppFont.regular(fontSize: 16, color: AppColors.ligthBaseNew)),
        ],
      ),
      trailing: SvgPicture.asset(AssetSvg.arrowTop, width: 20, height: 20),
    );
  }
}
