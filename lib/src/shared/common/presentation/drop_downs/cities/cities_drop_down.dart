import 'package:flutter/material.dart';
import 'package:wasli/core/config/values/assets.gen.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/city_entity.dart';
import 'Cities_drop_down_cubit.dart';
import '../drop_down.dart';

class CitiesDropDown extends StatelessWidget {
  const CitiesDropDown({
    super.key,
    this.city,
    this.onChanged,
  });
  final CityEntity? city;
  final void Function(CityEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown<CityEntity>(
      value: city,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      hint: appLocalizer.city,
      borderRadius: 12,
      prefixIc: Assets.icons.city,
      cubit: CitiesDropDownCubit(),
    );
  }
}
