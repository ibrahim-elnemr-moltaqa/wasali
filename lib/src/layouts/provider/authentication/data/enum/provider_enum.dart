import 'package:wasli/core/core.dart';

enum ProviderTypeEnum {
  resturant,
  supermarker;

  String get name {
    switch (this) {
      case ProviderTypeEnum.resturant:
        return appLocalizer.resturants;
      case ProviderTypeEnum.supermarker:
        return appLocalizer.supermarker;
    }
  }

  String get image {
    switch (this) {
      case ProviderTypeEnum.resturant:
        return AppImages.resturants;
      case ProviderTypeEnum.supermarker:
        return AppImages.supermarket;
    }
  }

  String get serchFieldHint {
    switch (this) {
      case ProviderTypeEnum.resturant:
        return appLocalizer.store_name;
      case ProviderTypeEnum.supermarker:
        return appLocalizer.supermarketName;
    }
  }
}
