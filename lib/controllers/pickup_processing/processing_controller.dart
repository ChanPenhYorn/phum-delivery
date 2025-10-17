import 'package:get/get.dart';
import 'package:phum_delivery/domain/entities/pickup_processing/pickup_entity.dart';
import 'package:phum_delivery/domain/usecases/pickup_usecase.dart';

class ProcessingController extends GetxController {
  final PickupUseCase pickupUseCase;

  ProcessingController(this.pickupUseCase);

  @override
  void onInit() {
    super.onInit();
    getPickup('1');
  }

  Rx<PickupEntity?> pickupModel = Rx<PickupEntity?>(null);
  RxBool isLoading = RxBool(false);

  Future<void> getPickup(String pickupId) async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 1));
    final pickup = await pickupUseCase.pickup(pickupId);
    pickupModel.value = pickup;
    isLoading.value = false;
  }
}
