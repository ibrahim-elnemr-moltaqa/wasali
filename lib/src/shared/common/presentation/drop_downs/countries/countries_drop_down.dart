import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../drop_down.dart';
import 'countries_drop_down_cubit.dart';

class CountriesDropDown extends StatelessWidget {
  const CountriesDropDown({
    super.key,
    this.country,
    this.onChanged,
  });
  final CommonEntity? country;
  final void Function(CommonEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown(
      value: country,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      title: appLocalizer.country,
      hint: appLocalizer.selectCountry,
      cubit: CountriesDropDownCubit(),
      borderRadius: 12,
    );
  }
}
