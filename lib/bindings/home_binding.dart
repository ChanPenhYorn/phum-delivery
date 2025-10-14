import 'package:get/get.dart';
import 'package:phum_delivery/controllers/home_controller.dart';

import 'package:phum_delivery/core/services/api/api_service.dart';
import 'package:phum_delivery/data/datasources/home_remote_ds.dart';
import 'package:phum_delivery/data/repositories/home_repo.dart';
import 'package:phum_delivery/domain/usecases/home_usecase.dart';
import 'package:phum_delivery/flavors.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(baseUrl: F.baseUrl));
    Get.lazyPut(() => HomeRemoteDs(Get.find<ApiClient>()));
    Get.lazyPut(() => HomeRepositoryImpl(Get.find<HomeRemoteDs>()));
    Get.lazyPut(() => HomeUseCase(Get.find<HomeRepositoryImpl>()));
    Get.lazyPut(() => HomeController(Get.find<HomeUseCase>()));
  }
}
