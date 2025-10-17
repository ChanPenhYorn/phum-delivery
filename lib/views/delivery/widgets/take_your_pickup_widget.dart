import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/r.dart';

class TakeYourPickupWidget extends StatelessWidget {
  const TakeYourPickupWidget({
    super.key,
    required this.name,
    required this.address,
  });

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
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
}
