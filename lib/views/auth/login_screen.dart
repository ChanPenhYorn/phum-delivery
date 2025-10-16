import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/auth/auth_controller.dart';
import 'package:phum_delivery/core/constants/app_string.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/core/utils/enum/app_textformfield_enum.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/widgets/app_button_widget.dart';

import '../../widgets/app_textformfield_widget.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController(text: "example@gmail.com");
  final passwordController = TextEditingController(text: "123456");

  final _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    // final authController = Get.put(AuthController(LoginUseCase()));

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(AppString.loginTitle.tr,
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
              SizedBox(height: 16),
              Text(AppString.password.tr, style: AppFont.regular(fontSize: 16)),
              SizedBox(height: 8),
              Obx(() => AppTextformfieldWidget(
                    controller: passwordController,
                    type: AppTextformfieldEnum.password,
                    hintText: AppString.password.tr,
                    obscureText: authController.isObscure.value,
                    suffixOnTap: authController.toggleObscure,
                  )),
              SizedBox(height: 24),
              AppButtonWidget(
                borderRadius: 30,
                isExpanded: true,
                label: AppString.login.tr,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    authController.login(
                      emailController.text,
                      passwordController.text,
                    );
                    Get.toNamed(AppRoutes.home);
                  }

                  Logger.log("Login button pressed");
                },
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.forgetPassword);
                    Logger.log(AppString.forgotPassword.tr);
                  },
                  child: Text(AppString.forgotPassword.tr,
                      style: AppFont.semiBold(
                          fontSize: 16, color: AppColors.primary)),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
