import 'dart:ui';

import 'package:wasli/core/core.dart';

enum SizeStatusEnum {
  active,
  inactive;

  factory SizeStatusEnum.formString(String value) =>
      SizeStatusEnum.values.firstWhere((element) => element.name == value);

  String get title {
    switch (this) {
      case SizeStatusEnum.active:
        return appLocalizer.active;
      case SizeStatusEnum.inactive:
        return appLocalizer.inactive;
    }
  }

  Color get color {
    switch (this) {
      case SizeStatusEnum.active:
        return AppColors.success600;
      case SizeStatusEnum.inactive:
        return AppColors.error;
    }
  }
}
