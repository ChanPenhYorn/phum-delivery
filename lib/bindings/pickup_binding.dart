import 'package:get/get.dart';
import 'package:phum_delivery/controllers/pickup_processing/processing_controller.dart';
import 'package:phum_delivery/core/services/api/api_service.dart';
import 'package:phum_delivery/data/datasources/pickup_remote_ds.dart';
import 'package:phum_delivery/data/repositories/pickup_repo.dart';
import 'package:phum_delivery/domain/usecases/pickup_usecase.dart';
import 'package:phum_delivery/flavors.dart';

class PickupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(baseUrl: F.baseUrl));
    Get.lazyPut(() => PickupRemoteDs(Get.find<ApiClient>()));
    Get.lazyPut(() => PickupRepositoryImpl(Get.find<PickupRemoteDs>()));
    Get.lazyPut(() => PickupUseCase(Get.find<PickupRepositoryImpl>()));
    Get.lazyPut(() => PickupProcessingController(Get.find<PickupUseCase>()));
  }
}
