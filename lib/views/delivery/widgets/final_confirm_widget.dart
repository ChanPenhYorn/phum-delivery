import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/confirm_entity.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';

class FinalConfirmWidget extends StatelessWidget {
  const FinalConfirmWidget({super.key, required this.confirm});
  final ConfirmEntity confirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text('Final Confirmation',
              style: AppFont.semiBold(
                  fontSize: 16, color: AppColors.ligthBaseNew)),
        ),
        const SizedBox(height: 8),
        Card(
          margin: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buldConfirmItem(
                    title: 'Approve by:',
                    value: confirm.approveBy,
                    imageUrl: AssetLocales.airCondition),
                SizedBox(height: 16),
                buldConfirmItem(
                    title: 'Issue by:',
                    value: confirm.issueBy,
                    imageUrl: AssetLocales.airCondition),
                SizedBox(height: 16),
                buldConfirmItem(
                    title: 'Delivery by:',
                    value: confirm.deliveryBy,
                    imageUrl: AssetLocales.airCondition),
                const SizedBox(height: 16),
                AppDeviderWidget(
                  indent: 0,
                  endIndent: 0,
                ),
                SizedBox(height: 16),
                buldConfirmItem(
                    title: 'Confirm Date:',
                    value: confirm.confirmDate,
                    imageUrl: AssetLocales.airCondition),
                SizedBox(height: 16),
                buldConfirmItem(
                    title: 'Phone:',
                    value: confirm.phone,
                    imageUrl: AssetLocales.airCondition),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Container buildContact({required String phone}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
    decoration: BoxDecoration(
      color: AppColors.basePrimary,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AssetSvg.phone,
          width: 12,
          height: 12,
        ),
        const SizedBox(width: 8),
        Text(phone,
            style: AppFont.semiBold(fontSize: 12, color: AppColors.primary)),
      ],
    ),
  );
}

Row buldConfirmItem(
    {required String title, required String value, required String imageUrl}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: AppFont.semiBold(fontSize: 16, color: AppColors.ligthBaseNew)),
      const SizedBox(width: 8),
      title == 'Confirm Date:'
          ? Text(DateFormat('dd MMM yyyy, HH:mm a').format(DateTime.now()),
              style:
                  AppFont.semiBold(fontSize: 14, color: AppColors.ligthBaseNew))
          : title == 'Phone:'
              ? buildContact(phone: value)
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipOval(
                          child: Container(
                            color: Colors.red,
                            child: Image.asset(
                              AssetLocales.airCondition,
                              width: 16,
                              height: 16,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(value,
                          style: AppFont.semiBold(
                              fontSize: 14, color: AppColors.ligthBaseNew)),
                    ],
                  ),
                ),
    ],
  );
}
