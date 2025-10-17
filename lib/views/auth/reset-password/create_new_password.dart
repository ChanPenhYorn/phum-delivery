import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/auth/auth_controller.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/core/utils/enum/app_textformfield_enum.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/widgets/app_action_widget.dart';
import 'package:phum_delivery/widgets/app_button_widget.dart';

import '../../../core/constants/app_string.dart';
import '../../../widgets/app_textformfield_widget.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final passwordController = TextEditingController(text: "123456");
  final confirmPasswordController = TextEditingController(text: "123456");

  final _formKey = GlobalKey<FormState>();

  CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
        appBar: AppBar(
            // title: Text("Forget Password"),
            ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 24),
                Text(AppString.createNewPassword.tr,
                    style: AppFont.semiBold(fontSize: 36)),
                SizedBox(height: 16),
                Text(AppString.newPassword.tr,
                    style: AppFont.regular(fontSize: 16)),
                SizedBox(height: 8),
                Obx(() => AppTextformfieldWidget(
                      obscureText: authController.isObscure.value,
                      controller: passwordController,
                      type: AppTextformfieldEnum.password,
                      hintText: AppString.newPassword.tr,
                      suffixOnTap: () {
                        authController.toggleObscure();
                      },
                    )),
                SizedBox(height: 16),
                Text(AppString.confirmPassword.tr,
                    style: AppFont.regular(fontSize: 16)),
                SizedBox(height: 8),
                Obx(() => AppTextformfieldWidget(
                      controller: confirmPasswordController,
                      type: AppTextformfieldEnum.password,
                      hintText: AppString.confirmPassword.tr,
                      suffixOnTap: () {
                        authController.toggleObscure();
                      },
                      obscureText: authController.isObscure.value,
                    )),
                SizedBox(height: 24),
                AppButtonWidget(
                  borderRadius: 30,
                  isExpanded: true,
                  label: AppString.continueButton.tr,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // authController.forgetPassword(emailController.text);
                      // Get.toNamed(AppRoutes.otp, arguments: {
                      //   "email": emailController.text,
                      // });
                      authController.createNewPassword(passwordController.text,
                          confirmPasswordController.text);

                      AppActionWidget.showSuccess(
                        title: AppString.congratulations.tr,
                        message: AppString.accountReadyToUse.tr,
                        onPressedConfirm: () {
                          Get.back();
                        },
                      );

                      await Future.delayed(const Duration(seconds: 3), () {
                        // Get.back();
                        Get.offAndToNamed(AppRoutes.login);
                      });
                    }

                    Logger.log("Continue button pressed");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
