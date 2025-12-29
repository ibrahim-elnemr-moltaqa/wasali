import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';

import '../drop_down.dart';
import 'Cities_drop_down_cubit.dart';

class CitiesDropDown extends StatelessWidget {
  const CitiesDropDown({
    super.key,
    this.city,
    this.areaId,
    this.onChanged,
  });
  final CommonEntity? city;
  final int? areaId;
  final void Function(CommonEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown<CommonEntity>(
      value: city,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      hint: appLocalizer.choose_city,
      title: appLocalizer.city,
      borderRadius: 12,
      cubit: CitiesDropDownCubit(areaId: areaId),
    );
  }
}
