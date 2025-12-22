import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';
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
                AppSvgIcon(path: AppIcons.more, size: 16)
                    .paddingStart(8)
                    .onTapScaleAnimation(onTap: () {
                  MoreStoreManagementBottomSheet.showModalBottomSheet(
                    context,
                    initialSwitchValue: category.isActive ? 1 : 0,
                    onSwitchChange: (value) {
                      // Status change might not be requested for categories yet based on prompt,
                      // but I'll keep the UI consistent with other tabs.
                    },
                    onDeleteTap: () {
                      // Delete logic (unassign) could be added here if needed.
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
