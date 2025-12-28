part of core;

class ApiConstants {
  const ApiConstants._();

  static const String domain = "http://backend.wasly.moltaqadev.com";
  // static const String apiBaseUrl = "$domain/client-api/v1/";

  static String addBaseUrl({RoleEnum? role}) => "$domain/${role?.apiRoute}/v1/";
  static String addGeneralBaseUrl = "$domain/client-api/v1/";

  static String apiKey = "QVER63S8aTEhjdMTr5av8Y6EPBhEd6";
}
