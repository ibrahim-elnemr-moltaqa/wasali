import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class PackageItemWidget extends StatelessWidget {
  final PackageEntity? package;
  final VoidCallback onSubscribe;

  const PackageItemWidget({
    super.key,
    this.package,
    required this.onSubscribe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppSvgIcon(
                    path: AppIcons.tag,
                    size: 23,
                  ),
                  const Gap(8),
                  Column(
                    children: [
                      Text(
                        package?.name ?? '',
                        style: TextStyles.bold14,
                      ),
                      const Gap(4),
                      Text(
                        '${appLocalizer.packageDuration}: ${package?.duration}', // Assuming localizer keys
                        style: TextStyles.regular12
                            .copyWith(color: AppColors.grey2Color),
                      ),
                    ],
                  ),
                ],
              ),
              const PriceWidget(),
            ],
          ),
          const Gap(16),
          Text(
            package?.description ?? '',
            style: TextStyles.regular12.copyWith(color: AppColors.grey2Color),
          ),
          const Gap(12),
          Divider(color: AppColors.dividerColor),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizer.subscribeNow, // Assuming key
                style: TextStyles.bold14,
              ),
              AppSvgIcon(path: AppIcons.arrowPackage),
            ],
          ),
        ],
      ),
    );
  }
}
