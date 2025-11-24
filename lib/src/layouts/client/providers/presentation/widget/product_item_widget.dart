import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/network_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/product_details_bottom_sheet.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppMedia(
          path: AppConstants.networkImageTest,
          fit: BoxFit.cover,
          height: 85,
          radius: 8,
        ).setContainerToView(
          color: AppColors.primary,
          height: 85,
          width: double.infinity,
          radius: 8,
        ),
        const Gap(8),
        const Text(
          'كريب لحمة',
          style: TextStyles.bold14,
        ),
        const Gap(4),
        const Text(
          'كريب محشو بقطع دجاج طرية وجبنة سايحة مع صوص لذيذ.',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(8),
        Row(
          children: [
            const Text(
              '500',
              style: TextStyles.bold14,
            ),
            const Gap(4),
            AppSvgIcon(path: AppIcons.sar)
          ],
        )
      ],
    )
        .setBorder(
      radius: 14,
      padding: const EdgeInsets.all(8),
    )
        .onTapScaleAnimation(onTap: () {
      ProductDetailsBottomSheet.show(context);
    });
  }
}
