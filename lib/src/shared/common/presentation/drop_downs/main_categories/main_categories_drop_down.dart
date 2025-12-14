import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/main_categories/main_categories_drop_down_cubit.dart';

class MainCategoriesDropDown extends StatelessWidget {
  const MainCategoriesDropDown({super.key, this.city, this.onChanged});
  final CategoryEntity? city;
  final void Function(CategoryEntity? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown<CategoryEntity>(
      value: city,
      itemDisplay: (displayValue) => displayValue?.name,
      onChanged: onChanged,
      hint: appLocalizer.mainCategories,
      borderRadius: 12,
      title: appLocalizer.mainCategories,
      cubit: MainCategoriesDropDownCubit(),
    );
  }
}
