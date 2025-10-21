import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/utils/app_debouncer.dart' show AppDebouncer;
import 'package:phum_delivery/views/delivery/widgets/shimmer/seach_pickup_shimmer.dart';
import 'package:phum_delivery/views/home/widgets/delivery_item_widget.dart';
import '../../controllers/pickup_processing/processing_controller.dart';
import '../../core/utils/app_font.dart';
import '../../r.dart';
import '../../widgets/app_action_widget.dart';
import '../../widgets/app_textformfield_widget.dart';

class SearchPickupScreen extends StatelessWidget {
  const SearchPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    final PickupProcessingController pickupController = Get.find();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AppTextformfieldWidget(
              autofocus: true,
              controller: searchController,
              borderRadius: BorderRadius.circular(16),
              hintText: AppString.search.tr,
              suffixIcon: Icon(Icons.cancel),
              suffixOnTap: () {
                searchController.text = "";
              },
              onChanged: (value) {
                AppDebouncer(milliseconds: 300).run(
                  () {
                    pickupController.searchPickup(value);
                  },
                );
              },
              isRequried: false,
            ),
          ),
        ),
        body: Obx(() {
          if (pickupController.isLoadingSearch.value) {
            return SearchPickupShimmerWidget();
          }

          if (pickupController.searchPickupModel.value.isEmpty) {
            return Center(
              child: Center(
                  child: AppActionWidget.noData(
                      title: "Search Pickup",
                      message:
                          "The pickup you entered cannot be found, please check the code again or search with another code.",
                      icon: AssetLocales.folder)),
            );
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Text(
                    "${AppString.resultFor.tr} “${searchController.text}”",
                    style: AppFont.semiBold(fontSize: 16)),
              ),
              Expanded(
                child: ListView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(),
                  itemCount: pickupController.searchPickupModel.value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withValues(alpha: 0.2),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: DeliveryItemWidget(
                            item:
                                pickupController.searchPickupModel.value[index],
                            onTap: () {},
                            isShowStatus: false),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
