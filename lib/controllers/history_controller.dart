import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/domain/usecases/history_usecase.dart';

class HistoryController extends GetxController {
  final HistoryUseCase historyUseCase;

  HistoryController(this.historyUseCase);

  RxInt selectSegmentValue = 1.obs;
  final focusNode = FocusNode();

  RxBool isLoadingHistory = false.obs;

  Rx<List<DeliveryItemEntity>> historyItemsList =
      Rx<List<DeliveryItemEntity>>([]);

  Rx<List<DeliveryItemEntity>> historyItemsListConfirm =
      Rx<List<DeliveryItemEntity>>([]);

  Rx<List<DeliveryItemEntity>> historyItemsListCancel =
      Rx<List<DeliveryItemEntity>>([]);

  @override
  void onInit() {
    super.onInit();
    getHistoryItems("");
  }

  void selectSegment(int value) {
    selectSegmentValue.value = value;
  }

  void requestFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void getHistoryItems(String token) async {
    isLoadingHistory.value = true;

    await Future.delayed(const Duration(seconds: 1));
    historyUseCase.historyItems(token).then((value) {
      historyItemsList.value = value;

      historyItemsListConfirm.value =
          value.where((value) => value.status == "Confirm").toList();

      historyItemsListCancel.value =
          value.where((value) => value.status == "Canceled").toList();
    });
    isLoadingHistory.value = false;
  }
}
