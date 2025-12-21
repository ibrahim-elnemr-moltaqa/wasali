import 'package:wasli/core/core.dart';

enum ProviderTypeEnum {
  restaurant,
  supermarket;

  String get name {
    switch (this) {
      case ProviderTypeEnum.restaurant:
        return appLocalizer.restaurants;
      case ProviderTypeEnum.supermarket:
        return appLocalizer.supermarkets;
    }
  }

  String get image {
    switch (this) {
      case ProviderTypeEnum.restaurant:
        return AppImages.restaurant;
      case ProviderTypeEnum.supermarket:
        return AppImages.supermarket;
    }
  }

  String get searchFieldHint {
    switch (this) {
      case ProviderTypeEnum.restaurant:
        return appLocalizer.store_name;
      case ProviderTypeEnum.supermarket:
        return appLocalizer.supermarketName;
    }
  }
}
