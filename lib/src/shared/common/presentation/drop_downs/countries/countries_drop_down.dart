import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import '../../../domain/entity/country_entity.dart';
import 'countries_drop_down_cubit.dart';
import '../drop_down.dart';

class CountriesDropDown extends StatelessWidget {
  const CountriesDropDown({
    super.key,
    this.country,
    this.onChanged,
  });
  final CountryEntity? country;
  final void Function(CountryEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown(
      value: country,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      title: appLocalizer.country,
      hint: appLocalizer.selectCountry,
      cubit: CountriesDropDownCubit(),
      // prefixIc: AppIcons.countryIc,
    );
  }
}
