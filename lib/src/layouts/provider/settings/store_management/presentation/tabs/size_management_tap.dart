import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/handle_response/handle_response_widget.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/size_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/sizes/sizes_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/bottom_sheet/floating_action_bottom_sheet.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/size_item_widget.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_floating_action_button.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/store_management_search_bar.dart';

class SizeManagementTap extends StatelessWidget {
  const SizeManagementTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SizesCubit()..getSizes(),
      child: BlocBuilder<SizesCubit, SizesState>(
        buildWhen: (previous, current) =>
            previous.sizesState != current.sizesState,
        builder: (context, state) {
          return HandleResponseWidget(
            status: state.sizesState,
            onRetry: () => context.read<SizesCubit>().getSizes(),
            successWithoutDataBuilder: () {
              return AppImage(path: AppImages.emptyState);
            },
            onSuccess: (data) {
              final sizes = data as List<SizeEntity>;
              return Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Column(
                    children: [
                      StoreManagementSearchBar(
                        hintText: appLocalizer.size_name,
                      ),
                      const Gap(24),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return SizeItemWidget(
                              index: index,
                              size: sizes[index],
                            );
                          },
                          separatorBuilder: (context, index) => const Gap(16),
                          itemCount: sizes.length,
                        ),
                      )
                    ],
                  ),
                  BlocListener<SizesCubit, SizesState>(
                    listenWhen: (previous, current) =>
                        previous.createSizeState != current.createSizeState,
                    listener: (context, state) {
                      if (state.createSizeState.isSuccess) {
                        AppLoadingWidget.removeOverlay();
                        AppToasts.success(context, message: 'Success');
                        AppRouter.pop();
                      } else if (state.createSizeState.isFailure) {
                        AppLoadingWidget.removeOverlay();
                        AppToasts.error(context,
                            message:
                                state.createSizeState.errorMessage ?? 'Error');
                      } else if (state.createSizeState.isLoading) {
                        AppLoadingWidget.overlay();
                      }
                    },
                    child: StoreManagementFloatingActionButton(
                        label: appLocalizer.add_new_size,
                        onTap: () =>
                            FloatingActionBottomSheet.showModalBottomSheet(
                              context,
                              title: appLocalizer.size_name,
                              hintText: appLocalizer.size_name,
                              onConfirmed: (value) {
                                context.read<SizesCubit>().createSize(value);
                              },
                            )),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
