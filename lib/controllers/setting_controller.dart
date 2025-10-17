import 'dart:ui';

import 'package:get/get.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/services/app_storage_service.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/r.dart';

class SettingController extends GetxController {
  final AppStorageService appStorageService = AppStorageService();
  final List<Map<String, dynamic>> settingList = [
    {
      "icon": SettingSvg.settingProfile,
      "title": AppString.profile,
    },
    {
      "icon": SettingSvg.settingLanguage,
      "title": AppString.language,
    },
    {
      "icon": SettingSvg.settingNotification,
      "title": AppString.notification,
    },
  ];

  final RxBool notification = true.obs;
  final RxString language = "km".obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void onNotificationToggle() {
    notification.value = !notification.value;
    appStorageService.saveNotification(notification.value);

    if (notification.value) {
      Logger.log("Notification is enabled");
    } else {
      Logger.log("Notification is disabled");
    }
  }

  Future<void> onLanguageToggle(String language) async {
    if (language == AppString.en) {
      Get.updateLocale(const Locale('en', 'US'));
      Logger.log("Change locale to English");
      Logger.log("Current locale to English ${Get.locale}");
    } else {
      Get.updateLocale(const Locale('km', 'KH'));
      Logger.log("Change locale to Khmer");
      Logger.log("Current locale to Khmer ${Get.locale}");
    }
    this.language.value = language;
    appStorageService.saveLanguage(language);
  }

  void init() async {
    language.value = appStorageService.getLanguage();
    await onLanguageToggle(language.value);

    notification.value = appStorageService.getNotification();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
