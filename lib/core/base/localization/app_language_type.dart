part of core;

/// [AppLanguageType] enum is used to represent the available languages in the app
///    ar: Arabic
///    en: English
///
/// @Author: Moltaqa's Flutter Team
enum AppLanguageType {
  ar(value: "ar", countryCode: "EG"),
  en(value: "en", countryCode: "US");

  final String value;
  final String countryCode;

  const AppLanguageType({required this.value, required this.countryCode});

  factory AppLanguageType.fromLanguageCode(String languageCode) {
    return AppLanguageType.values.firstWhere(
      (element) => element.value.toLowerCase() == languageCode.toLowerCase(),
      orElse: () => AppLanguageType.en,
    );
  }

  String get displayName {
    switch (this) {
      case AppLanguageType.ar:
        return "اللغة العربية";
      case AppLanguageType.en:
        return "English";
    }
  }

  Locale get local => Locale(
        value.toLowerCase(),
      );

  String get localCountryCode => "$value-$countryCode";

  Map<String, dynamic> get toMap => {
        "value": value,
        "countryCode": countryCode,
      };

  String get toJson => json.encode(toMap);

  factory AppLanguageType.fromJson(String tokenJson) {
    final Map<String, dynamic> encodedMap = json.decode(tokenJson);
    final String? value = encodedMap["value"]?.toLowerCase();
    final String? countryCode = encodedMap["countryCode"]?.toLowerCase();

    return AppLanguageType.values.firstWhere((element) =>
        element.value.toLowerCase() == value &&
        element.countryCode.toLowerCase() == countryCode);
  }
}
