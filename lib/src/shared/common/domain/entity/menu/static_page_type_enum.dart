import 'package:wasli/core/core.dart';


enum StaticPageTypeEnum {
  aboutUs,
  termsAndConditions,
  privacyPolicy;

  String get title {
    switch (this) {
      case StaticPageTypeEnum.aboutUs:
        return appLocalizer.aboutApp2;
      case StaticPageTypeEnum.termsAndConditions:
        return appLocalizer.termsAndConditions;
      case StaticPageTypeEnum.privacyPolicy:
        return appLocalizer.privacyPolicy;
    }
  }
  

  String get key {
    switch (this) {
      case StaticPageTypeEnum.aboutUs:
        return "about-us";
      case StaticPageTypeEnum.termsAndConditions:
        return "terms_and_conditions";
      case StaticPageTypeEnum.privacyPolicy:
        return "privacy_policy";
    
    }
  }
}
