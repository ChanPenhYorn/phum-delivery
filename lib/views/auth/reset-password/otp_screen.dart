import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/auth/auth_controller.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';
import 'package:phum_delivery/core/utils/app_font.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/widgets/app_button_widget.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatelessWidget {
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final email = Get.arguments["email"];
    final authController = Get.find<AuthController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authController.remainingSeconds.value == 0) {
        authController.startTimer();
      }
    });
    // authController.startTimer();

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    void verifyOtp() {
      authController.verifyOtp(emailController.text);

      Get.toNamed(AppRoutes.createNewPassword);
    }

    return Scaffold(
        appBar: AppBar(
            // title: Text("Forget Password"),
            ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 24),
              Text("Enter OTP Code", style: AppFont.semiBold(fontSize: 36)),
              Text(
                  "Check your email! We’ve sent a one-time verification code to $email. Enter the code below to verify your account.",
                  style: AppFont.regular(fontSize: 16)),
              SizedBox(height: 16),

              Center(
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Pinput(
                    validator: (s) {
                      if (s == null || s.isEmpty) {
                        return 'Please enter a PIN';
                      }
                      if (s.length != 4) {
                        // Example: requiring a 4-digit PIN
                        return 'PIN must be 4 digits';
                      }
                      return null;
                    },
                    length: 4,
                    controller: emailController,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    onCompleted: (pin) {
                      Logger.log(pin);
                      authController.verifyOtp(pin);
                    },
                  ),
                ),
              ),

              SizedBox(height: 16),
              Center(
                  child: Obx(
                () => GestureDetector(
                  onTap: () {
                    authController.remainingSeconds.value <= 0
                        ? authController.startTimer()
                        : null;
                  },
                  child: RichText(
                      text: authController.remainingSeconds.value > 0
                          ? TextSpan(children: [
                              TextSpan(
                                  text: "Your resend the code in ",
                                  style: AppFont.regular(fontSize: 16)),
                              TextSpan(
                                  text:
                                      "${authController.remainingSeconds.value}",
                                  style: AppFont.semiBold(
                                      fontSize: 16, color: AppColors.primary)),
                              TextSpan(
                                  text: " seconds",
                                  style: AppFont.regular(fontSize: 16)),
                            ])
                          : TextSpan(children: [
                              TextSpan(
                                  text: "Resend Code",
                                  style: AppFont.semiBold(
                                      fontSize: 16,
                                      color: AppColors.secondary)),
                            ])),
                ),
              )),
              SizedBox(height: 16),
              AppButtonWidget(
                borderRadius: 30,
                isExpanded: true,
                label: "Verify",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    verifyOtp();
                  }
                  Logger.log("Click Verify button");
                },
              ),
            ],
          ),
        ));
  }
}
