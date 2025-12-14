import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/vehicles/vehicle_drop_down_cubit.dart';

import '../drop_down.dart';

class VehiclesDropDown extends StatelessWidget {
  const VehiclesDropDown({
    super.key,
    this.vehicle,
    this.onChanged,
  });
  final CommonEntity? vehicle;
  final void Function(CommonEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown<CommonEntity>(
      value: vehicle,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      hint: appLocalizer.vehicle_type,
      borderRadius: 12,
      cubit: VehiclesDropDownCubit(),
    );
  }
}
