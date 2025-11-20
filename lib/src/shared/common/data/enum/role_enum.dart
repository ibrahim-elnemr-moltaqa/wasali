import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/presentation/main_page/domain/main_page_tap_entity.dart';

enum RoleEnum {
  client,
  provider,
  delivery;

  String get title {
    switch (this) {
      case client:
        return appLocalizer.client;
      case provider:
        return appLocalizer.provider;
      case delivery:
        return appLocalizer.delivery;
    }
  }

  String get image {
    switch (this) {
      case client:
        return AppIllustrations.onBoarding3;
      case provider:
        return AppIllustrations.onBoarding1;
      case delivery:
        return AppIllustrations.onBoarding2;
    }
  }

  List<MainPageTabEntity> get tabs {
    switch (this) {
      case client:
        return clientTaps;
      case provider:
        return providerTaps;
      case delivery:
        return deliveryTaps;
    }
  }

  String get registerRoute {
    switch (this) {
      case client:
        return AppRoutes.clientRegister;
      case provider:
        return AppRoutes.providerRegister;
      case delivery:
        return AppRoutes.deliveryRegister;
    }
  }
}
