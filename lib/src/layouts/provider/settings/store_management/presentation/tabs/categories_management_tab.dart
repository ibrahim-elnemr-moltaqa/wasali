import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/media/network_image.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/categories/store_categories_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/bottom_sheet/sub_categories_selection_bottom_sheet.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/section_item_widget.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_floating_action_button.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_search_bar.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';

class CategoriesManagementTab extends StatelessWidget {
  const CategoriesManagementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCategoriesCubit()..getProfileSubCategories(),
      child: BlocBuilder<StoreCategoriesCubit, StoreCategoriesState>(
        builder: (context, state) {
          return HandleResponseWidget(
            status: state.profileSubCategoriesState,
            onRetry: () =>
                context.read<StoreCategoriesCubit>().getProfileSubCategories(),
            successWithoutDataBuilder: () {
              return AppMedia(path: AppIllustrations.emptyOrders).center;
            },
            onSuccess: (data) {
              final categories = data as List<CategoryEntity>;
              return Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Column(
                    children: [
                      StoreManagementSearchBar(
                        hintText: appLocalizer.section_name,
                        currentActive: state.activeFilter,
                        onChanged: (query) {
                          context
                              .read<StoreCategoriesCubit>()
                              .getProfileSubCategories(name: query);
                        },
                        onStatusChanged: (status) {
                          context
                              .read<StoreCategoriesCubit>()
                              .getProfileSubCategories(active: status);
                        },
                      ),
                      const Gap(24),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return StoreCategoryItem(
                              index: index,
                              category: categories[index],
                            );
                          },
                          separatorBuilder: (context, index) => const Gap(16),
                          itemCount: categories.length,
                        ),
                      )
                    ],
                  ),
                  StoreManagementFloatingActionButton(
                    label: appLocalizer.add_new_section,
                    onTap: () {
                      SubCategoriesSelectionBottomSheet.show(
                        context,
                        initialSelectedCategories: categories,
                        storeCategoriesCubit:
                            context.read<StoreCategoriesCubit>(),
                      );
                    },
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
