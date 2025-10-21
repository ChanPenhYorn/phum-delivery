import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/extension/space_extension.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/widgets/app_action_widget.dart';
import 'package:phum_delivery/widgets/app_textformfield_widget.dart';
import '../../controllers/history_controller.dart';
import 'widgets/delivery_history_item_widget.dart';

class HistorySearchScreen extends StatelessWidget {
  const HistorySearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    final controller = TextEditingController();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  autofocus: true,
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
                    return Column(
                      children: [
                        Visibility(
                          visible:
                              historyController.selectSegmentValue.value == 1,
                          child: buildPickupHistory(
                            item: historyController.historyItemsList.value,
                            onTap: () {},
                          ),
                        ),
                        Visibility(
                          visible:
                              historyController.selectSegmentValue.value == 2,
                          child: buildPickupHistory(
                            item:
                                historyController.historyItemsListConfirm.value,
                            onTap: () {},
                          ),
                        ),
                        Visibility(
                          visible:
                              historyController.selectSegmentValue.value == 3,
                          child: buildPickupHistory(
                            item:
                                historyController.historyItemsListCancel.value,
                            onTap: () {},
                          ),
                        ),
                      ],
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildPickupHistory({
    required List<DeliveryItemEntity> item,
    required Function() onTap,
  }) {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(vertical: 8),
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: item.length,
      itemBuilder: (context, index) {
        return DeliveryHistoryItemWidget(item: item[index], onTap: onTap);
      },
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
