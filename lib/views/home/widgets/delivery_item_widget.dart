import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/r.dart';

class DeliveryItemWidget extends StatelessWidget {
  const DeliveryItemWidget({
    super.key,
    required this.item,
    required this.onTap,
    this.isShowStatus = true,
  });
  final DeliveryItemEntity item;
  final Function() onTap;
  final bool isShowStatus;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.top,
      leading: SvgPicture.asset(item.image, width: 40, height: 40),
      title: Text(item.name, style: AppFont.semiBold(fontSize: 16)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${item.total} items",
              style:
                  AppFont.regular(fontSize: 14, color: AppColors.ligthBaseNew)),
          GestureDetector(
            onTap: onTap,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Go to pickup at ",
                    style: AppFont.regular(
                        fontSize: 14, color: AppColors.ligthBaseNew),
                  ),
                  TextSpan(
                    text: "WS-TTP",
                    style: AppFont.semiBold(
                        fontSize: 14, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isShowStatus && item.status == "new")
            Container(
              margin: const EdgeInsets.only(right: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.lightBaseSecondary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "New",
                style: AppFont.semiBold(
                    fontSize: 12, color: AppColors.baseSecondary),
              ),
            ),
          SvgPicture.asset(AssetSvg.arrowTop, width: 20, height: 20),
        ],
      ),
    );
  }
}
