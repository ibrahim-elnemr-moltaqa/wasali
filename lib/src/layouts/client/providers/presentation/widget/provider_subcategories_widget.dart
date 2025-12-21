import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/src/layouts/client/providers/presentation/cubit/providers_cubit.dart';
import 'package:wasli/src/layouts/client/providers/presentation/page/all_providers_page.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sub_categories/sub_categories_drop_down_cubit.dart';

class ProviderSubCategoriesWidget extends StatefulWidget {
  const ProviderSubCategoriesWidget({
    super.key,
    required this.args,
    this.onSubCategorySelected,
  });

  final AllProvidersPageArgs args;
  final ValueChanged<int>? onSubCategorySelected;

  @override
  State<ProviderSubCategoriesWidget> createState() =>
      _ProviderSubCategoriesWidgetState();
}

class _ProviderSubCategoriesWidgetState
    extends State<ProviderSubCategoriesWidget> {
  int? selectedId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProvidersCubit, ProvidersState>(
      builder: (context, state) {
        return HandleResponseWidget(
          status: state.subcategoriesState,
          onRetry: () => context
              .read<SubCategoriesCubit>()
              .fetch(categoryId: widget.args.categoryId),
          onSuccess: (data) {
            if (selectedId == null && data != null && data.isNotEmpty) {
              selectedId = data.first.id;
            }
            return SizedBox(
              height: 87,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(16),
                  scrollDirection: Axis.horizontal,
                  itemCount: data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final CategoryEntity? category = data?[index];
                    return Column(
                      children: [
                        AppImage(
                          path: category?.image ?? '',
                          height: 60,
                          width: 60,
                        )
                            .circle(
                                borderColor: category?.id == selectedId
                                    ? AppColors.primary
                                    : Colors.transparent,
                                borderWidth: 1.5)
                            .onTapScaleAnimation(onTap: () {
                          setState(() {
                            selectedId = category?.id;
                          });
                          if (selectedId != null) {
                            widget.onSubCategorySelected?.call(selectedId!);
                          }
                        }),
                        const Gap(4),
                        Text(data?[index].name ?? '',
                            style: TextStyles.regular12)
                      ],
                    ).animateStaggered(index);
                  }),
            );
          },
          successWithoutDataBuilder: () {
            return const Center(
              child: Text('لا يوجد تصنيفات'),
            );
          },
        );
      },
    );
  }
}
