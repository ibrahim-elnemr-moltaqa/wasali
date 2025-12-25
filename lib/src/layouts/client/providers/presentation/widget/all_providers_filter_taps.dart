import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_filter_enum.dart';
import 'package:wasli/src/layouts/client/providers/presentation/cubit/providers_cubit.dart';
import 'package:wasli/src/layouts/client/providers/presentation/widget/store_status_sheet.dart';

class AllProvidersFilterTaps extends StatelessWidget {
  const AllProvidersFilterTaps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProvidersCubit, ProvidersState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: FittedBox(
                      child: Text(
                        state.selectedStatus?.title ?? appLocalizer.storeStatus,
                        style: TextStyles.bold12.copyWith(
                            color: state.selectedStatus != null
                                ? AppColors.black
                                : AppColors.grey2Color),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const Gap(12),
                  AppSvgIcon(
                    path: AppIcons.arrowDownIc,
                    size: 4,
                  )
                ],
              ).onTapScaleAnimation(onTap: () {
                StoreStatusSheet.show(
                  context,
                  currentStatus: state.selectedStatus,
                  onStatusChanged: (value) {
                    context.read<ProvidersCubit>().updateStatus(value);
                    Navigator.pop(context);
                  },
                );
              }).setBorder(
                  radius: 14,
                  padding: const EdgeInsets.all(8),
                  color:
                      state.selectedStatus != null ? AppColors.primary : null),
            ),
            const Gap(12),
            Expanded(
              child: Text(appLocalizer.topRated,
                      style: TextStyles.bold12.copyWith(
                          color: state.selectedFilter ==
                                  ProviderFilterEnum.topRated
                              ? AppColors.black
                              : AppColors.grey2Color))
                  .center
                  .setBorder(
                      radius: 14,
                      padding: const EdgeInsets.all(8),
                      color: state.selectedFilter == ProviderFilterEnum.topRated
                          ? AppColors.primary
                          : null)
                  .onTapScaleAnimation(onTap: () {
                context
                    .read<ProvidersCubit>()
                    .updateFilter(ProviderFilterEnum.topRated);
              }),
            ),
            const Gap(12),
            Expanded(
              child: Text(appLocalizer.closestMe,
                      style: TextStyles.bold12.copyWith(
                          color: state.selectedFilter ==
                                  ProviderFilterEnum.closestMe
                              ? AppColors.black
                              : AppColors.grey2Color))
                  .center
                  .setBorder(
                      radius: 14,
                      padding: const EdgeInsets.all(8),
                      color:
                          state.selectedFilter == ProviderFilterEnum.closestMe
                              ? AppColors.primary
                              : null)
                  .onTapScaleAnimation(onTap: () {
                context
                    .read<ProvidersCubit>()
                    .updateFilter(ProviderFilterEnum.closestMe);
              }),
            )
          ],
        );
      },
    );
  }
}
