import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/animated_list_extension.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/app_loading_widget.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/domain/entity/product_entity.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/cubits/products/products_cubit.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/bottom_sheet/more_store_management_bottom_sheet.dart';
import 'package:wasli/src/shared/common/presentation/widget/price_widget.dart';

class StoreMangeProductItemWidget extends StatelessWidget {
  const StoreMangeProductItemWidget({
    super.key,
    required this.index,
    required this.product,
  });
  final int index;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              AppImage(
                path: product.image ?? '',
                width: 85,
                height: 71,
              ).withRadius(
                radius: 8,
              ),
              const Gap(8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyles.regular14,
                    ),
                    const Gap(6),
                    Text(
                      product.description,
                      style: TextStyles.regular12,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(6),
                    Text(
                      product.sizes?.map((e) => e.size?.name).join(', ') ?? '',
                      style: TextStyles.bold14,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Text(
                  product.status == 1
                      ? appLocalizer.active
                      : appLocalizer.inactive,
                  style: TextStyles.bold12.copyWith(
                    color: product.status == 1
                        ? AppColors.success600
                        : AppColors.red500,
                  ),
                ),
                BlocListener<ProductsCubit, ProductsState>(
                  listenWhen: (previous, current) =>
                      (previous.changeProductStatusState !=
                              current.changeProductStatusState ||
                          previous.deleteProductState !=
                              current.deleteProductState) &&
                      current.selectedProductIdState.data == product.id,
                  listener: (context, state) {
                    if (state.changeProductStatusState.isFailure) {
                      AppToasts.error(context,
                          message:
                              state.changeProductStatusState.errorMessage ??
                                  '');
                    } else if (state.changeProductStatusState.isLoading ||
                        state.deleteProductState.isLoading) {
                      AppLoadingWidget.overlay();
                    } else if (state.changeProductStatusState.isSuccess ||
                        state.deleteProductState.isSuccess) {
                      AppLoadingWidget.removeOverlay();
                      if (state.deleteProductState.isSuccess) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  child: AppSvgIcon(path: AppIcons.more, size: 16)
                      .paddingStart(8)
                      .onTapScaleAnimation(onTap: () {
                    MoreStoreManagementBottomSheet.showModalBottomSheet(
                      context,
                      initialSwitchValue: product.status,
                      onSwitchChange: (value) {
                        context
                            .read<ProductsCubit>()
                            .changeProductStatus(product.id);
                      },
                      onDeleteTap: () {
                        context.read<ProductsCubit>().deleteProduct(product.id);
                      },
                    );
                  }),
                ),
              ],
            ),
            const Gap(30),
            PriceWidget(
              price: product.price.toString(),
            )
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
