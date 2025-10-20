import 'package:get/get.dart';
import 'package:phum_delivery/controllers/history_controller.dart';
import 'package:phum_delivery/domain/usecases/history_usecase.dart';

import '../core/services/api/api_service.dart';
import '../data/datasources/history_remote_ds.dart';
import '../data/repositories/history_repo.dart';
import '../flavors.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(baseUrl: F.baseUrl));
    Get.lazyPut(() => HistoryRemoteDs(Get.find<ApiClient>()));
    Get.lazyPut(() => HistoryRepoImpl(Get.find<HistoryRemoteDs>()));
    Get.lazyPut(() => HistoryUseCase(Get.find<HistoryRepoImpl>()));
    Get.lazyPut(() => HistoryController(Get.find<HistoryUseCase>()));
  }
}


    // Get.lazyPut(() => ApiClient(baseUrl: F.baseUrl));
    // Get.lazyPut(() => AuthRemoteDataSource(Get.find<ApiClient>()));
    // Get.lazyPut(() => AuthRepositoryImpl(Get.find<AuthRemoteDataSource>()));
    // Get.lazyPut(() => AuthUseCase(Get.find<AuthRepositoryImpl>()));
    // Get.lazyPut(() => AuthController(Get.find<AuthUseCase>()));