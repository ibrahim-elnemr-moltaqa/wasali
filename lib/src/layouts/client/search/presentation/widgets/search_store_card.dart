import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/search/domain/entities/search_entity.dart';
import 'package:wasli/src/shared/common/presentation/widget/product_discount_widget.dart';
import 'package:wasli/src/shared/common/presentation/widget/toggle_fav_widget.dart';

class SearchStoreCard extends StatelessWidget {
  final StoreEntity store;

  const SearchStoreCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        const Gap(16),
        if (store.products.isNotEmpty) _buildProductsList(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            AppImage(
              path: store.imageUrl,
              width: 70,
              height: 50,
              showFailIcon: true,
              radius: 12,
            ).onTapScaleAnimation(onTap: () {
              AppRouter.pushNamed(AppRoutes.providerPage);
            }),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      store.name,
                      style: TextStyles.bold14,
                    ),
                    const Gap(8),
                    Row(children: [
                      CircleAvatar(
                          radius: 2, backgroundColor: store.status.color),
                      const Gap(6),
                      Text(
                        store.status.title,
                        style: TextStyles.bold12
                            .copyWith(color: store.status.color),
                      ),
                      const Gap(4),
                    ])
                  ],
                ),
                const Gap(4),
                Row(
                  children: [
                    AppSvgIcon(path: AppIcons.starFill),
                    const Gap(2),
                    Text(
                      store.rating.toString(),
                      style: TextStyles.bold12,
                    ),
                    const Gap(4),
                    Text(
                      '(+${store.ratingCount})',
                      style: TextStyles.regular12
                          .copyWith(color: AppColors.grey2Color),
                    )
                  ],
                ),
                if (store.discount != null)
                  const ProductDiscountWidget().paddingTop(4),
              ],
            )
          ],
        ),
        ToggleFavWidget(
          isFavorite: store.isFavorite,
        ),
      ],
    );
  }

  Widget _buildProductsList() {
    return SizedBox(
      height: 155,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: store.products.length > 3 ? 3 : store.products.length,
        itemBuilder: (context, index) {
          final product = store.products[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppImage(
                path: product.imageUrl,
                width: 120,
                height: 85,
                showFailIcon: true,
                radius: 16,
              ),
              Text(
                product.name,
                style: TextStyles.regular14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(5),
              Text(
                product.priceLabel,
                style: TextStyles.light12,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ).setContainerToView(
              height: 155,
              width: 136,
              radius: 16,
              borderColor: AppColors.borderColor,
              padding: const EdgeInsets.all(8));
        },
        separatorBuilder: (context, index) => const Gap(16),
      ),
    );
  }
}
