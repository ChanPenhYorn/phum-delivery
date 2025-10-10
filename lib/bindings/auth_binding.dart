import 'package:get/get.dart';

import 'package:getx_mvvm_architecture/controllers/auth_controller.dart';
import 'package:getx_mvvm_architecture/core/services/api/api_service.dart';
import 'package:getx_mvvm_architecture/domain/usecases/auth_usecase.dart';
import 'package:getx_mvvm_architecture/data/datasources/auth_remote_ds.dart';
import 'package:getx_mvvm_architecture/data/repositories/auth_repo.dart';
import 'package:getx_mvvm_architecture/flavors.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(baseUrl: F.baseUrl));
    Get.lazyPut(() => AuthRemoteDataSource(Get.find<ApiClient>()));
    Get.lazyPut(() => AuthRepositoryImpl(Get.find<AuthRemoteDataSource>()));
    Get.lazyPut(() => AuthUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => AuthController(Get.find<AuthUseCase>()));
  }
}
