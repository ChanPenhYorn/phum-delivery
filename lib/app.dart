import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/theme_controller.dart';
import 'package:phum_delivery/core/utils/app_translation.dart';
import 'package:phum_delivery/routes/app_page.dart';
import 'package:phum_delivery/routes/app_route.dart';

class App extends StatelessWidget {
  final AppTranslation translations;

  App({super.key, required this.translations});
  final routeObserver = GetObserver();
  final ThemeController themeController = Get.find();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          locale: const Locale('en', 'US'), // Default locale
          fallbackLocale: const Locale('en', 'US'), // Fallback locale

          supportedLocales: const [
            Locale('en', 'US'),
            Locale('km', 'KH'),
          ],

          translations: translations,
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeController.currentTheme,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.routes,
          navigatorObservers: [routeObserver],
          // home: HomeScreen(),
        ));
  }
}
