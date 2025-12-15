import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class StoreManagementTabItem extends StatelessWidget {
  const StoreManagementTabItem({
    super.key,
    this.isProduct = false, required this.index,
  });
  final bool isProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isProduct) ...{
          Image.asset(
            AppImages.resturants,
            width: 85,
            height: 71,
            fit: BoxFit.cover,
          ).withRadius(
            radius: 8,
          ),
          const Gap(8),
        },
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TEST',
                style: TextStyles.regular14,
              ),
              if (isProduct) ...{
                const Gap(6),
                const Text(
                  'كريب محشو بقطع دجاج طرية وجبنة سايحة مع صوص لذيذ.',
                  style: TextStyles.regular12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              },
              const Gap(6),
              const Text('S', style: TextStyles.bold14),
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
                AppSvgIcon(path: AppIcons.more, size: 16).paddingStart(8),
              ],
            ),
            if (isProduct) ...{const Gap(30), const PriceWidget()}
          ],
        ),
      ],
    ).setBorder(
      radius: 12,
      padding: const EdgeInsets.all(12),
    ).animateStaggered(index);
  }
}
