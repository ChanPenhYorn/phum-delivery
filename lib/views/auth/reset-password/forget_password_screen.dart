import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/auth/auth_controller.dart';

import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/core/utils/enum/app_textformfield_enum.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/widgets/app_button_widget.dart';

import '../../../core/constants/app_string.dart';
import '../../../widgets/app_textformfield_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController(text: "example@gmail.com");

  final _formKey = GlobalKey<FormState>();

  ForgetPasswordScreen({super.key});

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
                Text(AppString.forgotPassword.tr,
                    style: AppFont.semiBold(fontSize: 36)),
                SizedBox(height: 16),
                Text(AppString.emailOrPhone.tr,
                    style: AppFont.regular(fontSize: 16)),
                SizedBox(height: 8),
                Obx(() => AppTextformfieldWidget(
                      controller: emailController,
                      type: emailController.text.startsWith(RegExp(r'^[0-9]'))
                          ? AppTextformfieldEnum.phone
                          : AppTextformfieldEnum.email,
                      hintText: AppString.emailOrPhone.tr,
                      suffixIcon: authController.isShowClearIcon.value
                          ? Icon(Icons.cancel)
                          : null,
                      suffixOnTap: () {
                        authController.setShowClearIcon(false);
                        emailController.text = "";
                      },
                      onChanged: (value) {
                        authController.setShowClearIcon(value.isNotEmpty);
                      },
                    )),

                SizedBox(height: 24),
                AppButtonWidget(
                  borderRadius: 30,
                  isExpanded: true,
                  label: AppString.continueButton.tr,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // authController.forgetPassword(emailController.text);
                      Get.toNamed(AppRoutes.otp, arguments: {
                        "email": emailController.text,
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
