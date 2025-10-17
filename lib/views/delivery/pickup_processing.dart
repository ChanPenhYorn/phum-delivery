import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/pickup_processing/processing_controller.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/delivery_entity.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_detail_entity.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/views/delivery/widgets/final_confirm_widget.dart';
import 'package:phum_delivery/views/delivery/widgets/shimmer/pickup_shimmer.dart';
import 'package:phum_delivery/widgets/app_devider_widget.dart';
import 'widgets/pickup_card_widget.dart';

class PickupProcessing extends StatelessWidget {
  const PickupProcessing({super.key});

  @override
  Widget build(BuildContext context) {
    final pickupController = Get.find<ProcessingController>();

    return Scaffold(
        backgroundColor: AppColors.lightGray,
        appBar: AppBar(
          backgroundColor: AppColors.lightGray,
          title: Text(pickupController.pickupModel.value?.delivery.name ?? ''),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Obx(() {
              final pickUpData = pickupController.pickupModel.value;

              if (!pickupController.isLoading.value) {
                return const PickupShimmer();
              }

              if (pickUpData == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: PickupCardWidget(
                      pickup: pickUpData,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                    child: buildPickupCardDetail(
                        pickupDetail: pickUpData.pickupDetails),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                    child: buildDeliveryUser(delivery: pickUpData.delivery),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),
                  SliverToBoxAdapter(
                      child: FinalConfirmWidget(confirm: pickUpData.confirm))
                ],
              );
            })));
  }

  Card buildDeliveryUser({required DeliveryEntity delivery}) {
    return Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.basePrimary,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AssetSvg.person,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(delivery.name,
                          style: AppFont.semiBold(
                              fontSize: 16, color: AppColors.black)),
                      Text(delivery.role,
                          style: AppFont.semiBold(
                              fontSize: 16, color: AppColors.ligthBaseNew)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AppDeviderWidget(
                indent: 0,
                endIndent: 0,
              ),
              const SizedBox(height: 16),
              buildContact(phone: delivery.phone),
            ],
          ),
        ));
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

  Card buildPickupCardDetail({required PickupDetailEntity pickupDetail}) {
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
                Expanded(
                  child: Text('Pickup details',
                      style: AppFont.semiBold(
                          fontSize: 16, color: AppColors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(pickupDetail.status,
                      style: AppFont.semiBold(
                          fontSize: 14, color: AppColors.ligthBaseNew),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                )),
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
                  Expanded(
                    child: Text(productName,
                        style: AppFont.semiBold(
                            fontSize: 16, color: AppColors.black),
                        overflow: TextOverflow.ellipsis),
                  ),
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
            style:
                AppFont.regular(fontSize: 16, color: AppColors.ligthBaseNew)),
        Text(value,
            style:
                AppFont.regular(fontSize: 16, color: AppColors.ligthBaseNew)),
      ],
    );
  }
}
