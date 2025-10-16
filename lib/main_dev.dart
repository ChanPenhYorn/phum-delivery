import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phum_delivery/app.dart';
import 'package:phum_delivery/core/utils/app_logger.dart';
import 'package:phum_delivery/core/utils/app_translation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'controllers/theme_controller.dart';
import 'firebase_options_dev.dart';
import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Pass all uncaught "fatal" errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics.
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // Log Firebase info
  Logger.log("🔥 Firebase initialized successfully");
  Logger.log("App name: ${firebaseApp.name}");
  Logger.log("Firebase options:");
  Logger.log("  - Project ID: ${firebaseApp.options.projectId}");
  Logger.log("  - App ID: ${firebaseApp.options.appId}");
  Logger.log("  - API Key: ${firebaseApp.options.apiKey}");
  Logger.log(
      "  - Messaging Sender ID: ${firebaseApp.options.messagingSenderId}");

  Get.put(ThemeController());
  AppTranslation translations = AppTranslation();
  translations.loadTranslations();
  F.appFlavor = Flavor.dev;

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String bundleId = packageInfo.packageName;

  Logger.log("Run on Dev Environment");
  Logger.log("Dev Bundle ID: $bundleId");
  runApp(App(translations: translations));
}
