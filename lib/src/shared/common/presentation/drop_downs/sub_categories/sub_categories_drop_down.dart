import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sub_categories/sub_categories_drop_down_cubit.dart';

class SubCategoriesDropDown extends StatelessWidget {
  const SubCategoriesDropDown({super.key, this.subCategories, this.onChanged});
  final List<CategoryEntity>? subCategories;
  final void Function(List<CategoryEntity>?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppMultiDropDown<CategoryEntity>(
      value: subCategories ?? [],
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      title: appLocalizer.sub_categories,
      hint: appLocalizer.sub_categories,
      borderRadius: 12,
      cubit: SubCategoriesDropDownCubit(),
    );
  }
}
