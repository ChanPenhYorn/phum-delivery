import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/r.dart';
import 'package:phum_delivery/widgets/app_cache_network_image_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../core/constants/app_string.dart';

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
            Image.asset(
              icon ?? AssetSvg.motoDelivery,
            ),
            Text(
              title ?? "No Data Available",
              textAlign: TextAlign.center,
              style: AppFont.semiBold(fontSize: 18),
            ),
            Text(
              message ?? "No Data Found",
              textAlign: TextAlign.center,
              style: AppFont.regular(fontSize: 14),
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
    Get.dialog(Dialog(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // const SizedBox(height: 24),
                Row(
                  children: [
                    SvgPicture.asset(
                      iconPath ?? SettingSvg.settingLogout,
                      width: 20,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        AppColors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      textAlign: TextAlign.center,
                      title?.tr ?? "title",
                      style: Get.theme.textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
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
              ]),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppColors.primary,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      cancelTitle?.tr ?? AppString.cancel.tr,
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: EdgeInsets.zero,
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppColors.primary,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: onPressedConfirm,
                    child: Text(
                      confirmTitle?.tr ?? AppString.okay.tr,
                      style: Get.theme.textTheme.bodyMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
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

  static showSuccess(
      {String? message,
      String? iconPath,
      String? title,
      String? cancelTitle,
      String? confirmTitle,
      void Function()? onPressedConfirm,
      bool cancel = true}) {
    Get.dialog(Dialog(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      child: PopScope(
        canPop: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 32),

            Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: AppColors.basePrimary,
                  borderRadius: BorderRadius.circular(100)),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.all(25),
                child: SvgPicture.asset(
                  iconPath ?? 'assets/svg/success.svg',
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            Text(
              textAlign: TextAlign.center,
              title?.tr ?? "title",
              style: Get.theme.textTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                textAlign: TextAlign.center,
                message?.tr ?? "message",
                style: Get.theme.textTheme.bodyMedium,
                // textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: CupertinoActivityIndicator(
                radius: 20.0, // Adjust the size
                color: AppColors.gray, // Customize the color
              ),
            ),
            const SizedBox(height: 32),

            // OverflowBar(
            //   children: [
            //     if (cancel)
            //       TextButton(
            //         onPressed: () {
            //           Get.back(); // Close the dialog
            //         },
            //         child: Text(
            //           cancelTitle?.tr ?? 'cancel'.tr,
            //           style: Get.theme.textTheme.bodyMedium!
            //               .copyWith(color: AppColors.primary),
            //         ),
            //       ),
            //     if (onPressedConfirm != null)
            //       ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             backgroundColor: AppColors.primary),
            //         onPressed: onPressedConfirm,
            //         child: Text(
            //           confirmTitle?.tr ?? 'okay'.tr,
            //           style: Get.theme.textTheme.bodyMedium!
            //               .copyWith(color: Colors.white),
            //         ),
            //       ),
            //   ],
            // ),
          ],
        ),
      ),
    ));
  }
}
