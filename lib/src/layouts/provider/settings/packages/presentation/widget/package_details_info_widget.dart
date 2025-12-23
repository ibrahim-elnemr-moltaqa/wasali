import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/widget/package_tile.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class PackageDetailsInfoWidget extends StatelessWidget {
  final SubscriptionEntity? subscriptionEntity;

  const PackageDetailsInfoWidget({
    super.key,
    this.subscriptionEntity,
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
                        subscriptionEntity?.package.name ?? '',
                        style: TextStyles.bold14,
                      ),
                      const Gap(4),
                      Text(
                        '${appLocalizer.packageDuration}: ${subscriptionEntity?.package.duration} ${appLocalizer.day}', // Assuming localizer keys
                        style: TextStyles.regular12
                            .copyWith(color: AppColors.grey2Color),
                      ),
                    ],
                  ),
                ],
              ),
              Builder(
                builder: (context) {
                  final totalSeconds =
                      (subscriptionEntity?.package.duration ?? 0) *
                          24 *
                          60 *
                          60;
                  final remainingDuration =
                      subscriptionEntity?.endDate.difference(DateTime.now()) ??
                          Duration.zero;
                  final remainingSeconds = remainingDuration.inSeconds;
                  final initialDuration =
                      (totalSeconds - remainingSeconds).clamp(0, totalSeconds);
                  return CircularCountDownTimer(
                    duration: totalSeconds,
                    initialDuration: initialDuration,
                    controller: CountDownController(),
                    width: 70,
                    height: 70,
                    ringColor: AppColors.error.withValues(alpha: .1),
                    fillColor: AppColors.error,
                    backgroundColor: Colors.transparent,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 2,
                    textStyle:
                        TextStyles.bold12.copyWith(color: AppColors.error),
                    textAlign: TextAlign.center,
                    textFormat: CountdownTextFormat.HH_MM_SS,
                    isReverse: true,
                    isReverseAnimation: true,
                    timeFormatterFunction:
                        (defaultFormatterFunction, duration) {
                      final days = duration.inDays;
                      if (days > 0) {
                        return '${appLocalizer.rest}\n$days\n ${appLocalizer.day}';
                      }
                      return defaultFormatterFunction(duration);
                    },
                  );
                },
              ),
            ],
          ),
          Text(
            subscriptionEntity?.package.description ?? '',
            style: TextStyles.regular12.copyWith(color: AppColors.grey2Color),
          ),
          PackageTile(
              label: appLocalizer.packagePrice,
              customValue: PriceWidget(
                  price: subscriptionEntity?.package.price.toString())),
          PackageTile(
              label: appLocalizer.subscription_start_date,
              value: subscriptionEntity?.startDate.toEEEEdMMMMy),
          PackageTile(
              label: appLocalizer.subscription_end_date,
              value: subscriptionEntity?.endDate.toEEEEdMMMMy),
        ],
      ),
    );
  }
}
