import 'package:get/get.dart';
import 'package:phum_delivery/r.dart';

class SettingController extends GetxController {
  final List<Map<String, dynamic>> settingList = [
    {
      "icon": SettingSvg.settingProfile,
      "title": "Profile",
    },
    {
      "icon": SettingSvg.settingLanguage,
      "title": "Language",
    },
    {
      "icon": SettingSvg.settingNotification,
      "title": "Notification",
    },
  ];

  final RxBool notification = false.obs;

  void onNotificationToggle() {
    notification.value = !notification.value;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
