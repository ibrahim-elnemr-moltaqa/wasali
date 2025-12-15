
import 'package:wasli/core/core.dart';

enum GenderEnum {
  male("male"),
  female("female"),
  other("other");

  final String apiValue;

  const GenderEnum(this.apiValue);

  factory GenderEnum.fromApiValue(String apiValue) =>
      GenderEnum.values.firstWhere(
        (element) => element.apiValue == apiValue,
        orElse: () => GenderEnum.other,
      );

  

  String get title {
    switch (this) {
      case GenderEnum.male:
        return appLocalizer.male;
      case GenderEnum.female:
        return appLocalizer.female;
      case GenderEnum.other:
        return appLocalizer.other;
    }
  }
}
