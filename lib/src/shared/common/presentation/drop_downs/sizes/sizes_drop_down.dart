import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sizes/sizes_drop_down_cubit.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sub_categories/sub_categories_drop_down_cubit.dart';

class SizesDropDown extends StatelessWidget {
  const SizesDropDown({super.key, this.sizes, this.onChanged});
  final List<SizeEntity>? sizes;
  final void Function(List<SizeEntity>?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppMultiDropDown<SizeEntity>(
      value: sizes ?? [],
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      title: appLocalizer.sizes,
      hint: appLocalizer.sizes,
      borderRadius: 12,
      cubit: SizesDropDownCubit(),
    );
  }
}
