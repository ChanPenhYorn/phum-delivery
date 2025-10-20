import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/core/utils/app_bouncer.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/views/history/widgets/shimmer/history_item_shimmer.dart';
import 'package:phum_delivery/widgets/app_action_widget.dart';
import '../../controllers/history_controller.dart';
import 'widgets/delivery_history_item_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.lightGray,
        title: Text(AppString.history.tr),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AssetSvg.search),
            onPressed: () {
              Get.toNamed(AppRoutes.historySearch);
            },
          ),
          IconButton(
            icon: SvgPicture.asset(AssetSvg.filters),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Obx(() {
              final selectedIndex = historyController.selectSegmentValue.value;

              final Map<int, Widget> children = {
                1: buildTabSegmentTitle(
                    index: 1,
                    isSelectedIndex: selectedIndex,
                    title: AppString.all.tr),
                2: buildTabSegmentTitle(
                    index: 2,
                    isSelectedIndex: selectedIndex,
                    title: AppString.confirm.tr),
                3: buildTabSegmentTitle(
                    index: 3,
                    isSelectedIndex: selectedIndex,
                    title: AppString.canceled.tr),
              };

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomSlidingSegmentedControl<int>(
                  initialValue: selectedIndex,
                  children: children,
                  isStretch: true,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    AppBouncer(milliseconds: 300).run(() {
                      historyController.selectSegment(v);
                    });
                  },
                ),
              );
            }),
            8.height,
            Container(
                // padding: const EdgeInsets.symmetric(vertical: 8),

                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Obx(() {
                  if (historyController.isLoadingHistory.value) {
                    return ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const HistoryItemShimmer();
                      },
                    );
                  }

                  switch (historyController.selectSegmentValue.value) {
                    case 1:
                      if (historyController.historyItemsList.value.isEmpty) {
                        return SizedBox(
                          height: 300,
                          child: Center(
                              child: AppActionWidget.noData(
                                  title: "Not Found",
                                  message:
                                      "The code you entered cannot be found, please check the code again or search with another code.",
                                  icon: AssetLocales.folder)),
                        );
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            historyController.historyItemsList.value.length,
                        itemBuilder: (context, index) {
                          return DeliveryHistoryItemWidget(
                              item: historyController
                                  .historyItemsList.value[index],
                              onTap: () {});
                        },
                      );
                    case 2:
                      if (historyController
                          .historyItemsListConfirm.value.isEmpty) {
                        return SizedBox(
                          height: 300,
                          child: Center(
                              child: AppActionWidget.noData(
                                  title: "Not Found",
                                  message:
                                      "The code you entered cannot be found, please check the code again or search with another code.",
                                  icon: AssetLocales.folder)),
                        );
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: historyController
                            .historyItemsListConfirm.value.length,
                        itemBuilder: (context, index) {
                          return DeliveryHistoryItemWidget(
                              item: historyController
                                  .historyItemsListConfirm.value[index],
                              onTap: () {});
                        },
                      );
                    case 3:
                      if (historyController
                          .historyItemsListCancel.value.isEmpty) {
                        return SizedBox(
                          height: 300,
                          child: Center(
                              child: AppActionWidget.noData(
                                  title: "Not Found",
                                  message:
                                      "The code you entered cannot be found, please check the code again or search with another code.",
                                  icon: AssetLocales.folder)),
                        );
                      }
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: historyController
                            .historyItemsListCancel.value.length,
                        itemBuilder: (context, index) {
                          return DeliveryHistoryItemWidget(
                              item: historyController
                                  .historyItemsListCancel.value[index],
                              onTap: () {});
                        },
                      );
                    default:
                      return const SizedBox.shrink();
                  }
                }))
          ],
        ),
      ),
    );
  }

  Widget buildTabSegmentTitle(
      {required int index,
      required int isSelectedIndex,
      required String title}) {
    return Text(title,
        style: AppFont.semiBold(
            fontSize: 14,
            color:
                isSelectedIndex == index ? AppColors.white : AppColors.black));
  }
}
