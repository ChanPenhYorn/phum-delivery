import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/setting_controller.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';

Future<dynamic> languageSelectButtonSheet(
    BuildContext context, SettingController settingController) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Language",
                    style: AppFont.semiBold(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  languageitem(
                      settingController: settingController,
                      language: AppString.en,
                      title: "🇬🇧 English"),
                  const SizedBox(height: 8),
                  languageitem(
                      settingController: settingController,
                      language: AppString.km,
                      title: "🇰🇭 Khmer"),
                ],
              ),
            ),
          ));
}

Container languageitem(
    {required SettingController settingController,
    required String language,
    required String title}) {
  return Container(
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
          width: 1,
          color: settingController.language.value == language
              ? AppColors.primary
              : AppColors.lightGray),
    ),
    child: ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Obx(() => RadioGroup(
                groupValue: settingController.language.value,
                onChanged: (value) {
                  settingController.onLanguageToggle(language);
                  Get.back();
                },
                child: Radio(
                  activeColor: AppColors.primary,
                  value: language,
                ),
              )),
          Text(title),
        ],
      ),
      onTap: () {
        settingController.onLanguageToggle(language);
        Get.back();
      },
    ),
  );
}
