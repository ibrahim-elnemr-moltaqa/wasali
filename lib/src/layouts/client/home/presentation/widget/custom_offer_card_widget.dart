import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/home/domain/entities/offer_entity.dart';
import 'package:wasli/src/shared/common/presentation/widget/product_discount_widget.dart';
import 'package:wasli/src/shared/common/presentation/widget/toggle_fav_widget.dart';

class CustomOfferCardWidget extends StatelessWidget {
  const CustomOfferCardWidget({
    super.key,
    this.offer,
  });

  final OfferEntity? offer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            AppImage(
              path: offer?.imageUrl ?? AppConstants.networkImageTest,
              width: 108,
              height: 86,
              radius: 8,
            ),
            Positioned(
                top: 5,
                right: 5,
                child: const ToggleFavWidget().setContainerToView(
                  color: Colors.white,
                  radius: 100,
                  padding: const EdgeInsets.all(4),
                )),
          ],
        ),
        const Gap(8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      offer?.title ?? 'بابا جونز',
                      style: TextStyles.bold14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      AppSvgIcon(path: AppIcons.starFill),
                      const Gap(2),
                      const Text(
                        '4.5',
                        style: TextStyles.bold12,
                      ),
                      const Gap(4),
                      Text(
                        '(+100)',
                        style: TextStyles.regular12
                            .copyWith(color: AppColors.grey2Color),
                      )
                    ],
                  ),
                ],
              ),
              const Gap(4),
              Text(
                offer?.description ??
                    'متجرنا يقدّم لك تجربة تسوّق سهلة وسريعة، مع مجموعة واسعة من المنتجات عالية الجودة بأسعار تنافسية، وخدمة توصيل موثوقة حتى باب بيتك.',
                style: TextStyles.light12.copyWith(
                  color: AppColors.grey2Color,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(8),
              const ProductDiscountWidget()
            ],
          ),
        )
      ],
    )
        .setBorder(radius: 12, padding: const EdgeInsets.all(8))
        .onTapScaleAnimation(onTap: () {
      AppRouter.pushNamed(AppRoutes.providerPage);
    });
  }
}
