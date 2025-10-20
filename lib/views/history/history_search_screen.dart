import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/widgets/app_textformfield_widget.dart';
import '../../controllers/history_controller.dart';
import 'widgets/delivery_history_item_widget.dart';

class HistorySearchScreen extends StatelessWidget {
  const HistorySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (Get.isRegistered<HistoryController>()) {
    //     historyController.requestFocus(context);
    //   }
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      historyController.requestFocus(context);
    });

    final controller = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.lightGray,
        title: Text(AppString.searchHistory.tr),
        actions: [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AppTextformfieldWidget(
                focusNode: historyController.focusNode,
                controller: controller,
                fillColor: AppColors.white,
                prefixIcon: Icon(Icons.search),
                borderRadius: BorderRadius.circular(30),
                hintText: 'Search',
                isRequried: false,
              ),
            ),
            16.height,
            Container(
                // padding: const EdgeInsets.symmetric(vertical: 8),

                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Obx(() {
                  if (historyController.historyItemsList.value.isEmpty) {
                    return Center(
                      child: Text("No history items"),
                    );
                  }
                  return Column(
                    children: [
                      Visibility(
                        visible:
                            historyController.selectSegmentValue.value == 1,
                        child: ListView.builder(
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
                        ),
                      ),
                      Visibility(
                        visible:
                            historyController.selectSegmentValue.value == 2,
                        child: ListView.builder(
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
                        ),
                      ),
                      Visibility(
                        visible:
                            historyController.selectSegmentValue.value == 3,
                        child: ListView.builder(
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
                        ),
                      ),
                    ],
                  );
                })),
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
