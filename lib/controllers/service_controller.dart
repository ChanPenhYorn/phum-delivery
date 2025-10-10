import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ServiceController extends GetxController {
  RxString appVersion = '0.0.0'.obs;
  @override
  void onInit() {
    super.onInit();
    getAppversion();
  }

  void getAppversion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion.value = packageInfo.version;
    update();
  }
}
