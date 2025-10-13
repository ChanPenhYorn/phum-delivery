import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/splash_controller.dart';
import 'package:phum_delivery/core/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text("Delivery",
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          // Center(
          //   child: Image.asset(
          //     "assets/gif/loading.gif",
          //     width: 48,
          //     height: 48,
          //   ),
          // ),
          Center(
            child: CupertinoActivityIndicator(
              radius: 20.0, // Adjust the size
              color: AppColors.white, // Customize the color
            ),
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
