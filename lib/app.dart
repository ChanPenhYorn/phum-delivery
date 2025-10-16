import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/controllers/theme_controller.dart';
import 'package:phum_delivery/core/services/app_storage_service.dart';
import 'package:phum_delivery/core/utils/app_translation.dart';
import 'package:phum_delivery/routes/app_page.dart';
import 'package:phum_delivery/routes/app_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  final AppTranslation translations;
  final Locale locale;

  App({super.key, required this.translations, required this.locale});
  final routeObserver = GetObserver();
  final ThemeController themeController = Get.find();

  final AppStorageService appStorageService = AppStorageService();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          locale: locale, // Default locale
          fallbackLocale: const Locale('en', 'US'), // Fallback locale

          supportedLocales: const [
            Locale('en', 'US'),
            Locale('km', 'KH'),
          ],

          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          translations: translations,
          title: 'Phum Delivery',
          debugShowCheckedModeBanner: false,
          theme: themeController.currentTheme,
          initialRoute: AppRoutes.splash,
          getPages: AppPages.routes,
          navigatorObservers: [routeObserver],
          // home: HomeScreen(),
        ));
  }
}
