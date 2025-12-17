import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/sizes/sizes_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/bottom_sheet/more_store_management_bottom_sheet.dart';

class SizeItemWidget extends StatelessWidget {
  const SizeItemWidget({
    super.key,
    required this.index,
    this.size,
  });
  final int index;
  final SizeEntity? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appLocalizer.size,
                style: TextStyles.regular14,
              ),
              const Gap(6),
              Text(size?.name ?? '', style: TextStyles.bold14),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Text(
                  size?.status == 1
                      ? appLocalizer.active
                      : appLocalizer.inactive,
                  style: TextStyles.bold12.copyWith(
                      color: size?.status == 1
                          ? AppColors.success600
                          : AppColors.red500),
                ),
                BlocListener<SizesCubit, SizesState>(
                  listenWhen: (previous, current) =>
                      previous.changeSizeStatusState !=
                          current.changeSizeStatusState ||
                      previous.deleteSizeState != current.deleteSizeState,
                  listener: (context, state) {
                    if (state.changeSizeStatusState.isFailure) {
                      AppToasts.error(context,
                          message:
                              state.changeSizeStatusState.errorMessage ?? '');
                    } else if (state.changeSizeStatusState.isLoading) {
                      AppLoadingWidget.overlay();
                    } else if (state.changeSizeStatusState.isSuccess) {
                      AppLoadingWidget.removeOverlay();
                    }

                    if (state.deleteSizeState.isFailure) {
                      AppToasts.error(context,
                          message: state.deleteSizeState.errorMessage ?? '');
                    } else if (state.deleteSizeState.isLoading) {
                      AppLoadingWidget.overlay();
                    } else if (state.deleteSizeState.isSuccess &&
                        state.selectedSizeIdState.data == size?.id) {
                      AppLoadingWidget.removeOverlay();
                      Navigator.pop(context);
                    }
                  },
                  child: AppSvgIcon(path: AppIcons.more, size: 16),
                ).paddingStart(8).onTapScaleAnimation(onTap: () {
                  MoreStoreManagementBottomSheet.showModalBottomSheet(
                    context,
                    initialSwitchValue: size?.status,
                    onSwitchChange: (value) {
                      context.read<SizesCubit>().changeSizeStatus(size!.id);
                    },
                    onDeleteTap: () {
                      context.read<SizesCubit>().deleteSize(size!.id);
                    },
                  );
                })
              ],
            ),
          ],
        ),
      ],
    )
        .setBorder(
          radius: 12,
          padding: const EdgeInsets.all(12),
        )
        .animateStaggered(index);
  }
}
