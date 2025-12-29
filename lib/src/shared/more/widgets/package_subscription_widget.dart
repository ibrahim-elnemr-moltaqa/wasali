import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/app_fail_widget.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/subscription_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_state.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/package_details_page.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/packages_page.dart';

class PackageSubscriptionWidget extends StatelessWidget {
  const PackageSubscriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackagesSubscriptionsCubit, PackagesSubscriptionsState>(
            builder: (context, state) {
    return state.subscriptionsState.when(
      failure: (error) => AppFailWidget(
        text: error.message,
      ),
      success: (subscriptions) =>
          subscriptionDisplay(subscription: subscriptions.first)
              .onTapScaleAnimation(
                  onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<PackagesSubscriptionsCubit>(),
                  child: const PackageDetailsPage(),
                ),
              ))),
      loading: () => const CircularProgressIndicator(),
      successWithoutData: () => subscriptionDisplay().onTapScaleAnimation(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<PackagesSubscriptionsCubit>(),
                  child: const PackagesPage(),
                ),
              ))),
    );
            },
          ).setBorder(
      radius: 12,
      padding: const EdgeInsets.all(8),
    );
  }

  Row subscriptionDisplay({SubscriptionEntity? subscription}) {
    final int? restDays =
        subscription?.endDate.difference(subscription.startDate).inDays;
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              AppSvgIcon(path: AppIcons.tag),
              const Gap(8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      subscription?.package.name ??
                          appLocalizer.start_subscription,
                      style: TextStyles.bold14,
                    ),
                    const Gap(4),
                    if (restDays != null) ...{
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(text: appLocalizer.rest),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: restDays.toString(),
                            style: TextStyles.bold14
                                .copyWith(color: AppColors.black),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(text: appLocalizer.dayToEndSubscription),
                        ]),
                        style: TextStyles.regular12
                            .copyWith(color: AppColors.grey2Color),
                      ),
                    } else ...{
                      Text(appLocalizer.start_subscription_description,
                          style: TextStyles.regular12
                              .copyWith(color: AppColors.grey2Color)),
                    }
                  ],
                ),
              ),
            ],
          ),
        ),
        AppSvgIcon(path: AppIcons.arrowPackage)
      ],
    );
  }
}
