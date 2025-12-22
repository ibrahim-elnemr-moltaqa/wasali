import 'package:wasli/core/core.dart';

enum ProviderFilterEnum {
  topRated,
  closestMe;

  String get title {
    switch (this) {
      case ProviderFilterEnum.topRated:
        return appLocalizer.topRated;
      case ProviderFilterEnum.closestMe:
        return appLocalizer.closestMe;
    }
  }
}
