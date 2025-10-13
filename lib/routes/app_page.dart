import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:phum_delivery/bindings/auth_binding.dart';
import 'package:phum_delivery/bindings/splash_binding.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:phum_delivery/views/auth/login_screen.dart';
import 'package:phum_delivery/views/home/home_screen.dart';
import 'package:phum_delivery/views/splash/splash_screen.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
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
  ];
}
