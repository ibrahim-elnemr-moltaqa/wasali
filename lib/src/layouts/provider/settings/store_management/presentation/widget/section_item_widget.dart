import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/bottom_sheet/more_store_management_bottom_sheet.dart';

class SectionItemWidget extends StatelessWidget {
  const SectionItemWidget({
    super.key,
    required this.index,
  });
  final int index;

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
              Text(
                appLocalizer.size,
                style: TextStyles.regular14,
              ),
              const Gap(6),
              const Text('hamada', style: TextStyles.bold14),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  appLocalizer.active,
                  style:
                      TextStyles.bold12.copyWith(color: AppColors.success600),
                ),
                AppSvgIcon(path: AppIcons.more, size: 16)
                    .paddingStart(8)
                    .onTapScaleAnimation(onTap: () {
                  MoreStoreManagementBottomSheet.showModalBottomSheet(
                    context,
                    initialSwitchValue: 1,
                    onSwitchChange: (value) {},
                    onDeleteTap: () {},
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
