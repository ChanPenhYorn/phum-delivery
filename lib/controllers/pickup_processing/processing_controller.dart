import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/domain/entities/delivery_item_entity.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_entity.dart';
import 'package:phum_delivery/domain/usecases/pickup_usecase.dart';

class PickupProcessingController extends GetxController {
  final PickupUseCase pickupUseCase;

  PickupProcessingController(this.pickupUseCase);

  @override
  void onInit() {
    super.onInit();

    getPickup('1');
    searchPickup('1');
  }

  Rx<PickupEntity?> pickupModel = Rx<PickupEntity?>(null);
  Rx<List<DeliveryItemEntity>> searchPickupModel =
      Rx<List<DeliveryItemEntity>>([]);
  RxBool isLoading = RxBool(false);
  RxBool isLoadingSearch = RxBool(false);

  Future<void> getPickup(String pickupId) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final pickup = await pickupUseCase.pickup(pickupId);
    pickupModel.value = pickup;
    isLoading.value = false;
  }

  Future<void> searchPickup(String pickupId) async {
    isLoadingSearch.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final pickup = await pickupUseCase.searchPickup(pickupId);
    searchPickupModel.value = pickup;
    isLoadingSearch.value = false;
  }
}
