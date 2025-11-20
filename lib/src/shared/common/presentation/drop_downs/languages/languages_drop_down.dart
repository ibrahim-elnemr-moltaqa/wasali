import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import '../../../domain/entity/language_entity.dart';
import '../drop_down.dart';
import 'lanuages_drop_down_cubit.dart';

class LanguagesDropDown extends StatelessWidget {
  const LanguagesDropDown({
    super.key,
    this.language = const [],
    this.onChanged,
  });
  final List<LanguageEntity> language;
  final void Function(List<LanguageEntity> value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppMultiDropDown<LanguageEntity>(
      value: language,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      title: appLocalizer.language,
      hint: appLocalizer.selectLanguages,
      cubit: LanguagesDropDownCubit(),
      // prefixIc: AppIcons.countryIc,
    );
  }
}
