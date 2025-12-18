import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';

enum ProviderStatusEnum {
  opened,
  closed,
  all;

  String get title {
    switch (this) {
      case ProviderStatusEnum.opened:
        return appLocalizer.opened;
      case ProviderStatusEnum.closed:
        return appLocalizer.closed;
      default:
        return appLocalizer.all;
    }
  }

  Color get color {
    switch (this) {
      case ProviderStatusEnum.opened:
        return AppColors.success500;
      case ProviderStatusEnum.closed:
        return AppColors.red500;
      default:
        return AppColors.primary;
    }
  }

  String get value {
    switch (this) {
      case ProviderStatusEnum.opened:
        return 'opened';
      case ProviderStatusEnum.closed:
        return 'closed';
      default:
        return 'all';
    }
  }
}
