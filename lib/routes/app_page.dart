import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:phum_delivery/bindings/auth_binding.dart';
import 'package:phum_delivery/bindings/home_binding.dart';

import 'package:phum_delivery/bindings/splash_binding.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/views/auth/login_screen.dart';
import 'package:phum_delivery/views/auth/reset-password/create_new_password.dart';
import 'package:phum_delivery/views/auth/reset-password/forget_password_screen.dart';
import 'package:phum_delivery/views/auth/reset-password/otp_screen.dart';
import 'package:phum_delivery/views/home/home_screen.dart';
import 'package:phum_delivery/views/setting/profile_screen.dart';
import 'package:phum_delivery/views/setting/setting_screen.dart';
import 'package:phum_delivery/views/splash/splash_screen.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: AppRoutes.splash,
        page: () => SplashScreen(),
        binding: SplashBinding()),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.createNewPassword,
      page: () => CreateNewPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => SettingScreen(),
    ),
    GetPage(
      name: AppRoutes.personal,
      page: () => ProfileScreen(),
    ),
  ];
}
