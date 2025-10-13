import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/widgets/app_cache_network_image_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppActionWidget {
  static void rawSnackbar({
    String? title,
    required String message,
    required Color color,
  }) {
    Get.rawSnackbar(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      borderRadius: 16,
      title: title ?? 'information'.tr,
      message: message.tr,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      duration: const Duration(seconds: 2),
    );
  }

  static ClipOval buildProfileUserNetwork({
    required String imageUrl,
    double? width,
    double? height,
  }) {
    return ClipOval(
      child: AppCachedNetwordImageWidget(
        width: width ?? 40,
        height: height ?? 40,
        imageUrl: imageUrl,
      ),
    );
  }

  static Center loadingIndicator(context) {
    return Center(
      child: CircularProgressIndicator(
        padding: const EdgeInsets.all(12),
        color: AppColors.primary,
      ),
    );
  }

  static Future loadingDialog() {
    return Get.defaultDialog(
      backgroundColor: Colors.transparent,
      title: "Loading...",
      titleStyle: Get.textTheme.bodyLarge?.copyWith(color: AppColors.primary),
      content: PopScope(
        canPop: false,
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static Widget noData({
    String? message,
    String? icon,
    String? title,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // const SizedBox(
            //   height: 16,
            // ),
            Image.asset(
              icon ?? 'assets/images/no-content.png',
              width: 32,
              height: 32,
              // color: AppColor.primaryColor,
            ),
            // const SizedBox(
            //   height: ,
            // ),
            Text(
              title ?? "",
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  static showActionMessage(
      {String? message,
      String? iconPath,
      String? title,
      String? cancelTitle,
      String? confirmTitle,
      void Function()? onPressedConfirm,
      bool cancel = true}) {
    Get.dialog(AlertDialog(
        actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        contentPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        titlePadding: const EdgeInsets.all(0),
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        content: PopScope(
          canPop: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Image.asset(
                iconPath ?? 'assets/images/information-button.png',
                width: 32,
                height: 32,
                color: AppColors.primary,
              ),
              const SizedBox(height: 24),
              Text(
                textAlign: TextAlign.center,
                title?.tr ?? "title",
                style: Get.theme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  textAlign: TextAlign.center,
                  message?.tr ?? "message",
                  style: Get.theme.textTheme.bodyMedium,
                  // textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        actions: [
          OverflowBar(
            children: [
              if (cancel)
                TextButton(
                  onPressed: () {
                    Get.back(); // Close the dialog
                  },
                  child: Text(
                    cancelTitle?.tr ?? 'cancel'.tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
              if (onPressedConfirm != null)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary),
                  onPressed: onPressedConfirm,
                  child: Text(
                    confirmTitle?.tr ?? 'okay'.tr,
                    style: Get.theme.textTheme.bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
            ],
          ),
        ]));
  }

  //!handler success and error
  static void handleSuccess(String message, dynamic success) {
    Get.log('Success: $message - ${success?.toString()}');
    Get.snackbar(
      'Information',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
    );
  }

  static void handleError(String message, dynamic error, Color color) {
    Get.log('Error: $message - ${error?.toString()}');
    Get.snackbar(
      'Information',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
    );
  }

  static void showToast(String message) async {
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: AppColors.primary.withValues(alpha: 0.7),
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  static Widget loadAudio() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          'Loading audio...',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ));
  }
}
