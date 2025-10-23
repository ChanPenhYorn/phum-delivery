import 'dart:io';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phum_delivery/controllers/setting_controller.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/core/utils/app_translation.dart';
import 'package:phum_delivery/firebase_options_dev.dart'
    // ignore: library_prefixes
    as DefaultFirebaseOptionsDev;
import 'package:phum_delivery/firebase_options_staging.dart'
    // ignore: library_prefixes
    as DefaultFirebaseOptionsStaging;
import 'package:phum_delivery/firebase_options.dart'
    // ignore: library_prefixes
    as DefaultFirebaseOptionsProd;
import 'package:package_info_plus/package_info_plus.dart';
import 'app.dart';
import 'controllers/theme_controller.dart';
import 'core/services/app_storage_service.dart';
import 'flavors.dart';

void main() async {
  // 1. Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Set System UI (optional: status bar, orientation)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.dev,
  );

  Logger.log("Flavor: ${F.appFlavor}");

  try {
    FirebaseApp firebaseApp;
    // 4. Initialize Firebase with flavor-specific options
    firebaseApp = await Firebase.initializeApp(
      options: F.appFlavor == Flavor.dev
          ? DefaultFirebaseOptionsDev.DefaultFirebaseOptions.currentPlatform
          : F.appFlavor == Flavor.staging
              ? DefaultFirebaseOptionsStaging
                  .DefaultFirebaseOptions.currentPlatform
              : DefaultFirebaseOptionsProd
                  .DefaultFirebaseOptions.currentPlatform,
    );

    // await GoogleSignIn.instance.initialize(
    //     clientId:
    //         "677667737775-8tltf5h299sros5moi98ubneof3jon3r.apps.googleusercontent.com");

    //! Log Firebase info
    Logger.log("🔥 Firebase initialized successfully");
    Logger.log("App name: ${firebaseApp.name}");
    Logger.log("Firebase options:");
    Logger.log("  - Project ID: ${firebaseApp.options.projectId}");
    Logger.log("  - App ID: ${firebaseApp.options.appId}");
    Logger.log("  - API Key: ${firebaseApp.options.apiKey}");

    final info = await PackageInfo.fromPlatform();
    Logger.log('Package: ${info.packageName}');
    Logger.log('Version: ${info.version}');

    // 5. Pass uncaught errors to Crashlytics
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    // 6. Pass uncaught async errors to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    Logger.log('Firebase initialized for flavor: ${F.name}');
  } catch (e) {
    Logger.log('Failed to initialize Firebase');
    // Optionally: show error screen or fallback
  }

  // 7. Initialize GetX Controllers
  Get.put(ThemeController());
  Get.put(SettingController());

  AppTranslation translations = AppTranslation();
  translations.loadTranslations();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String bundleId = packageInfo.packageName;

  Logger.log("Run on Dev Environment");

  Logger.log("Dev Bundle ID: $bundleId");

  AppStorageService appStorageService = AppStorageService();
  await appStorageService.init();

  Locale locale = const Locale('en', 'US');

  if (appStorageService.getLanguage() == 'km') {
    locale = const Locale('km', 'KH');
  } else {
    locale = const Locale('en', 'US');
  }

  runApp(App(translations: translations, locale: locale));
}
