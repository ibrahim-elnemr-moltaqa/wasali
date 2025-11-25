import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/media/svg_icon.dart';

class ProviderOrderCardWidget extends StatelessWidget {
  const ProviderOrderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ORD-2025-001#',
          style: TextStyles.bold12,
        ),
        const Gap(4),
        Row(
          children: [
            const Text('30 أغسطس', style: TextStyles.regular12),
            CircleAvatar(radius: 1, backgroundColor: AppColors.text),
            const Text('03:50 مساءً', style: TextStyles.regular12),
          ],
        ),
        const Gap(12),
        Divider(
          thickness: 1,
          color: AppColors.lightGreyColor,
        ),
        const Gap(12),
        Row(
          children: [
            AppSvgIcon(path: AppIcons.scooter),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'توصيل',
                  style: TextStyles.regular14,
                ),
                Text(
                  appLocalizer.pickup_type,
                  style: TextStyles.regular12
                      .copyWith(color: AppColors.grey2Color),
                ),
              ],
            )
          ],
        ),
        const Gap(12),
        Row(
          children: [
            AppSvgIcon(path: AppIcons.user),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ibrahim',
                  style: TextStyles.regular14,
                ),
                Text(
                  appLocalizer.client_name,
                  style: TextStyles.regular12
                      .copyWith(color: AppColors.grey2Color),
                ),
              ],
            )
          ],
        ),
        const Gap(24),
        AppButton(
          text: appLocalizer.in_preparation,
          onPressed: () {},
        )
      ],
    ).setBorder(
        color: AppColors.lightGreyColor,
        radius: 8,
        padding: const EdgeInsets.all(12));
  }
}
