import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';

class PackageSubscriptionWidget extends StatelessWidget {
  const PackageSubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppSvgIcon(path: AppIcons.tag),
        const Gap(8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                appLocalizer.start_subscription,
                style: TextStyles.bold14,
              ),
              const Gap(4),
              Text(appLocalizer.start_subscription_description),
            ],
          ),
        ),
        AppSvgIcon(path: AppIcons.forwardArrowIc)
      ],
    ).setBorder(
      radius: 12,
      padding: const EdgeInsets.all(8),
    );
  }
}
