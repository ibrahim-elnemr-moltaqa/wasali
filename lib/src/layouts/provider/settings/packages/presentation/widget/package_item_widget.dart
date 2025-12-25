import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/packages/domain/entity/package_entity.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/cubit/packages_subscriptions_state.dart';
import 'package:wasli/src/layouts/provider/settings/packages/presentation/widget/pay_package_bottom_sheet.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class PackageItemWidget extends StatelessWidget {
  final PackageEntity? package;

  const PackageItemWidget({
    super.key,
    this.package,
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
              PriceWidget(
                price: package?.price.toString(),
              ),
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
          BlocListener<PackagesSubscriptionsCubit, PackagesSubscriptionsState>(
            listenWhen: (previous, current) =>
                previous.subscribePackageState != current.subscribePackageState,
            listener: (context, state) {
              if (state.subscribePackageState.isFailure) {
                AppLoadingWidget.removeOverlay();
                AppToasts.error(context,
                    message: state.subscriptionsState.errorMessage ?? '');
              } else if (state.subscribePackageState.isSuccess) {
                AppLoadingWidget.removeOverlay();
                Navigator.pop(context);
                Navigator.pop(context);
              } else if (state.subscribePackageState.isLoading) {
                AppLoadingWidget.overlay();
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  appLocalizer.subscribeNow,
                  style: TextStyles.bold14,
                ),
                AppSvgIcon(path: AppIcons.arrowPackage),
              ],
            ),
          ).onTapScaleAnimation(
              onTap: () => PayPackageBottomSheet.show(
                    context,
                    package: package,
                    onTapPay: () {
                      if (package != null) {
                        context
                            .read<PackagesSubscriptionsCubit>()
                            .subscribePackage(package!.id);
                      }
                    },
                  )),
        ],
      ),
    );
  }
}
