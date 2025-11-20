part of core;

class ApiConstants {
  const ApiConstants._();

  static const String domain = "https://backend.bonian.moltaqadev.com";
  static const String apiBaseUrl = "$domain/client-api/v1/";

  static String addBaseUrl(String url) => "$domain/$url";

  static String apiKey = "QVER63S8aTEhjdMTr5av8Y6EPBhEd6";
}
