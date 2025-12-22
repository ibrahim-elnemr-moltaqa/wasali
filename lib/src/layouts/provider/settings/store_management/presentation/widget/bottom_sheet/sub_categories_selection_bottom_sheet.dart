import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/categories/store_categories_cubit.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';

class SubCategoriesSelectionBottomSheet extends StatefulWidget {
  const SubCategoriesSelectionBottomSheet({
    super.key,
    required this.initialSelectedCategories,
  });

  final List<CategoryEntity> initialSelectedCategories;

  static Future<void> show(
    BuildContext context, {
    required List<CategoryEntity> initialSelectedCategories,
    required StoreCategoriesCubit storeCategoriesCubit,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => BlocProvider.value(
        value: storeCategoriesCubit,
        child: SubCategoriesSelectionBottomSheet(
          initialSelectedCategories: initialSelectedCategories,
        ),
      ),
    );
  }

  @override
  State<SubCategoriesSelectionBottomSheet> createState() =>
      _SubCategoriesSelectionBottomSheetState();
}

class _SubCategoriesSelectionBottomSheetState
    extends State<SubCategoriesSelectionBottomSheet> {
  late List<int> selectedIds;

  @override
  void initState() {
    super.initState();
    selectedIds = widget.initialSelectedCategories.map((e) => e.id).toList();
    context.read<StoreCategoriesCubit>().getAllSubCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20).copyWith(bottom: 40),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizer.sectionsManagement,
                style: TextStyles.bold18,
              ),
              const CloseButton(),
            ],
          ),
          const Gap(20),
          Expanded(
            child: BlocBuilder<StoreCategoriesCubit, StoreCategoriesState>(
              builder: (context, state) {
                return HandleResponseWidget(
                  status: state.allSubCategoriesState,
                  onRetry: () => context
                      .read<StoreCategoriesCubit>()
                      .getAllSubCategories(),
                  onSuccess: (data) {
                    final allSubCategories = data as List<CategoryEntity>;
                    return ListView.separated(
                      itemCount: allSubCategories.length,
                      separatorBuilder: (context, index) => const Gap(16),
                      itemBuilder: (context, index) {
                        final category = allSubCategories[index];
                        final isSelected = selectedIds.contains(category.id);
                        return CheckboxListTile(
                          value: isSelected,
                          title: Text(category.name),
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedIds.add(category.id);
                              } else {
                                selectedIds.remove(category.id);
                              }
                            });
                          },
                          controlAffinity: ListTileControlAffinity.trailing,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          const Gap(20),
          BlocConsumer<StoreCategoriesCubit, StoreCategoriesState>(
            listenWhen: (previous, current) =>
                previous.assignSubCategoriesState !=
                current.assignSubCategoriesState,
            buildWhen: (previous, current) =>
                previous.assignSubCategoriesState !=
                current.assignSubCategoriesState,
            listener: (context, state) {
              if (state.assignSubCategoriesState.isFailure) {
                AppToasts.error(context,
                    message:
                        state.assignSubCategoriesState.failure?.message ?? '');
              } else if (state.assignSubCategoriesState.isSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return AppButton(
                isLoading: state.assignSubCategoriesState.isLoading,
                text: appLocalizer.save,
                onPressed: () {
                  context
                      .read<StoreCategoriesCubit>()
                      .assignSubCategories(selectedIds);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
