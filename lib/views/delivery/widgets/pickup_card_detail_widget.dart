import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_detail_entity.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';

class PickupCardDetailWidget extends StatelessWidget {
  const PickupCardDetailWidget({
    super.key,
    required this.pickupDetail,
  });

  final PickupDetailEntity pickupDetail;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pickup details',
                    style:
                        AppFont.semiBold(fontSize: 16, color: AppColors.black)),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      pickupDetail.status,
                      style: AppFont.semiBold(
                          fontSize: 14, color: AppColors.ligthBaseNew),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
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
            buildProduct(
              productName: pickupDetail.name,
              productImage: AssetLocales.airCondition,
              productQuantity: pickupDetail.quantity,
              productUom: pickupDetail.uom,
              productRemark: pickupDetail.remark,
              productDes: pickupDetail.description,
            ),
            const SizedBox(height: 8),
            AppDeviderWidget(
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 8),
            Text('Remark',
                style: AppFont.regular(
                    fontSize: 14, color: AppColors.ligthBaseNew)),
            Text(pickupDetail.remark,
                style: AppFont.semiBold(fontSize: 14, color: AppColors.black)),
          ],
        ),
      ),
    );
  }
}

Row buildProduct(
    {required String productName,
    required String productImage,
    required String productQuantity,
    required String productUom,
    required String productRemark,
    required String productDes}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        AssetLocales.airCondition,
        width: 64,
        height: 64,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(productName,
                    style:
                        AppFont.semiBold(fontSize: 16, color: AppColors.black)),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  AssetSvg.copy,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(productDes,
                style: AppFont.regular(
                    fontSize: 16, color: AppColors.ligthBaseNew)),
            const SizedBox(height: 8),
            AppDeviderWidget(
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 8),
            buildProductItem(label: 'Quantity', value: productQuantity),
            const SizedBox(height: 8),
            buildProductItem(label: 'UoM', value: productUom),
          ],
        ),
      ),
    ],
  );
}

Row buildProductItem({required String label, required String value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    // mainAxisSize: MainAxisSize.min,
    children: [
      Text(label,
          style: AppFont.regular(fontSize: 16, color: AppColors.ligthBaseNew)),
      Text(value,
          style: AppFont.regular(fontSize: 16, color: AppColors.ligthBaseNew)),
    ],
  );
}
