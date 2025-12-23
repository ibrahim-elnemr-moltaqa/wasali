import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/categories/store_categories_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/bottom_sheet/more_store_management_bottom_sheet.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';

class StoreCategoryItem extends StatelessWidget {
  const StoreCategoryItem({
    super.key,
    required this.index,
    required this.category,
  });
  final int index;
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appLocalizer.section_name),
              const Gap(4),
              Text(
                category.name,
                style: TextStyles.bold14,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  category.isActive
                      ? appLocalizer.active
                      : appLocalizer.inactive,
                  style: TextStyles.bold12.copyWith(
                      color: category.isActive
                          ? AppColors.success600
                          : AppColors.red500),
                ),
                BlocListener<StoreCategoriesCubit, StoreCategoriesState>(
                  listenWhen: (previous, current) =>
                      previous.changeSubCategoryStatus !=
                      current.changeSubCategoryStatus,
                  listener: (context, state) {
                    if (state.changeSubCategoryStatus.isFailure) {
                      AppToasts.error(context,
                          message:
                              state.changeSubCategoryStatus.errorMessage ?? '');
                    } else if (state.changeSubCategoryStatus.isLoading) {
                      AppLoadingWidget.overlay();
                    } else if (state.changeSubCategoryStatus.isSuccess) {
                      AppLoadingWidget.removeOverlay();
                    }
                  },
                  child: AppSvgIcon(path: AppIcons.more, size: 16),
                ).paddingStart(8).onTapScaleAnimation(onTap: () {
                  MoreStoreManagementBottomSheet.showModalBottomSheet(
                    context,
                    initialSwitchValue: category.isActive ? 1 : 0,
                    onSwitchChange: (value) {
                      context
                          .read<StoreCategoriesCubit>()
                          .changeSubCategoryStatus(category.id);
                    },
                  );
                })
              ],
            ),
          ],
        ),
      ],
    )
        .setBorder(
          radius: 12,
          padding: const EdgeInsets.all(12),
        )
        .animateStaggered(index);
  }
}
