import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/common_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/areas/areas_drop_down_cubit.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class AreasDropDown extends StatelessWidget {
  const AreasDropDown({super.key, this.city, this.onChanged});
  final CommonEntity? city;
  final void Function(CommonEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown<CommonEntity>(
      value: city,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      hint: appLocalizer.choose_region,
      borderRadius: 12,
      cubit: AreasDropDownCubit(),
    );
  }
}
