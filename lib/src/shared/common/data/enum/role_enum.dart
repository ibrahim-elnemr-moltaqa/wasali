import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/presentation/main_page/domain/main_page_tap_entity.dart';

enum RoleEnum {
  client,
  provider,
  delivery,
  guest;

  String get title {
    switch (this) {
      case client:
        return appLocalizer.client;
      case provider:
        return appLocalizer.provider;
      case delivery:
        return appLocalizer.delivery;
      default:
        return '';
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
      default:
        return '';
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
      default:
        return [];
    }
  }

  String get registerRoute {
    switch (this) {
      case client:
        return AppRoutes.clientRegister;
      case provider:
        return AppRoutes.providerRegisterPage;
      case delivery:
        return AppRoutes.deliveryRegister;
      default:
        return '';
    }
  }

  String get apiRoute {
    switch (this) {
      case client:
        return 'client-api';
      case provider:
        return 'provider-api';
      case delivery:
        return 'delivery-api';
      default:
        return '';
    }
  }
}
