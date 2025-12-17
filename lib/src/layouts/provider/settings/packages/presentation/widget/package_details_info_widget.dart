import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class PackageDetailsInfoWidget extends StatelessWidget {
  final PackageEntity? package;
  final DateTime? startDate;
  final DateTime? endDate;

  const PackageDetailsInfoWidget({
    super.key,
    this.package,
    this.startDate,
    this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppSvgIcon(
                    path: AppIcons.tag,
                    size: 31,
                  ),
                  const Gap(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        package?.name ?? 'hamada',
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
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.error, width: 1.5),
                  color: AppColors.error.withValues(alpha: .1),
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'متبقي',
                      style:
                          TextStyles.regular12.copyWith(color: AppColors.error),
                    ),
                    Text(
                      '22',
                      style: TextStyles.bold14.copyWith(color: AppColors.error),
                    ),
                    Text(
                      'يوم', // Localize: appLocalizer.day
                      style:
                          TextStyles.regular12.copyWith(color: AppColors.error),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            package?.description ?? '',
            style: TextStyles.regular12.copyWith(color: AppColors.grey2Color),
          ),
          _buildInfoRow(appLocalizer.packagePrice, '',
              customValue: const PriceWidget()),
          _buildInfoRow(appLocalizer.subscription_start_date, '12/05/2025'),
          _buildInfoRow(appLocalizer.subscription_end_date, '12/05/2025'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Widget? customValue}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyles.regular12.copyWith(color: AppColors.grey2Color),
        ),
        customValue ??
            Text(
              value,
              style: TextStyles.bold14,
            ),
      ],
    );
  }
}
