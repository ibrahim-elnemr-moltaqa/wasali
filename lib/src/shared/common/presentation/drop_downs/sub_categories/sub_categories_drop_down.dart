import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sub_categories/sub_categories_drop_down_cubit.dart';

enum DropDownSelectionType {
  single,
  multi,
}

class SubCategoriesDropDown extends StatelessWidget {
  const SubCategoriesDropDown({
    super.key,
    required this.selectionType,
    this.subCategories,
    this.selectedCategory,
    this.onMultiChanged,
    this.onSingleChanged,
  });

  final DropDownSelectionType selectionType;

  // multi
  final List<CategoryEntity>? subCategories;
  final void Function(List<CategoryEntity>?)? onMultiChanged;

  // single
  final CategoryEntity? selectedCategory;
  final void Function(CategoryEntity?)? onSingleChanged;

  @override
  Widget build(BuildContext context) {
    switch (selectionType) {
      case DropDownSelectionType.multi:
        return _MultiSubCategoriesDropDown(
          subCategories: subCategories,
          onChanged: onMultiChanged,
        );

      case DropDownSelectionType.single:
        return _SingleSubCategoryDropDown(
          selectedCategory: selectedCategory,
          onChanged: onSingleChanged,
        );
    }
  }
}

class _MultiSubCategoriesDropDown extends StatelessWidget {
  const _MultiSubCategoriesDropDown({
    this.subCategories,
    this.onChanged,
  });

  final List<CategoryEntity>? subCategories;
  final void Function(List<CategoryEntity>?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppMultiDropDown<CategoryEntity>(
      value: subCategories ?? [],
      itemDisplay: (item) => item?.name,
      onChanged: onChanged,
      title: appLocalizer.sub_categories,
      hint: appLocalizer.sub_categories,
      borderRadius: 12,
      cubit: SubCategoriesDropDownCubit(),
    );
  }
}

class _SingleSubCategoryDropDown extends StatelessWidget {
  const _SingleSubCategoryDropDown({
    this.selectedCategory,
    this.onChanged,
  });

  final CategoryEntity? selectedCategory;
  final void Function(CategoryEntity?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppSingleDropDown<CategoryEntity>(
      value: selectedCategory,
      itemDisplay: (item) => item?.name,
      onChanged: onChanged,
      title: appLocalizer.section,
      hint: appLocalizer.select_section,
      borderRadius: 12,
      cubit: SubCategoriesDropDownCubit(),
    );
  }
}
