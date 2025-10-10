import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/routes/app_route.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  RxString appVersion = '0.0.0'.obs;
  @override
  void onInit() {
    super.onInit();
    getAppversion();
    _navigateToHome();
  }

  void getAppversion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
  }

  // Method to navigate after a delay
  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3)); // 3 seconds delay
    Get.offAllNamed(AppRoutes.home); // Navigate to the Home screen using GetX
  }
}
