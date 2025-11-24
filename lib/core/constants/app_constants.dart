part of core;

class AppConstants {
  const AppConstants._();

  static const String appleStoreUrl = "https:balcony/temp";
  static const String googlePlayUrl = "https:balcony/temp";

  /// for testing
  static const String networkImageTest =
      "https://www.elmin7a.com/wp-content/uploads/2021/08/noon-egypt-jobs-customer-service-agent.png";

  static String get getAppProductionUrl {
    if (Platform.isAndroid) {
      return googlePlayUrl;
    } else {
      return appleStoreUrl;
    }
  }
}
