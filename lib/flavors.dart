enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Dev App';
      case Flavor.staging:
        return 'Staging App';
      case Flavor.prod:
        return 'Prod App';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://dev.example.com';
      case Flavor.staging:
        return 'https://staging.example.com';
      case Flavor.prod:
        return 'https://example.com';
    }
  }

  static String get appIcon {
    switch (appFlavor) {
      case Flavor.dev:
        return 'assets/images/app_logo_dev.png';
      case Flavor.staging:
        return 'assets/images/app_logo_staging.png';
      case Flavor.prod:
        return 'assets/images/app_logo.png';
    }
  }
}
