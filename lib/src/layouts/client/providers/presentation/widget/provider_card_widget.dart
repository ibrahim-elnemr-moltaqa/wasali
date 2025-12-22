import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/data/model/provider_model.dart';

class ProviderCardWidget extends StatelessWidget {
  const ProviderCardWidget({
    super.key,
    required this.provider,
  });

  final ProviderModel provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppImage(
          path: provider.imageUrl,
          width: 108,
          height: 86,
          radius: 8,
        ),
        const Gap(8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      provider.name,
                      style: TextStyles.bold14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(8),
                  Row(children: [
                    CircleAvatar(
                        radius: 2, backgroundColor: provider.status.color),
                    const Gap(6),
                    Text(
                      provider.status.title,
                      style: TextStyles.bold12
                          .copyWith(color: provider.status.color),
                    ),
                    const Gap(4),
                  ]),
                  // const Spacer(),
                  // const ToggleFavWidget(),
                ],
              ),
              const Gap(4),
              Row(
                children: [
                  AppSvgIcon(path: AppIcons.starFill),
                  const Gap(2),
                  Text(
                    provider.rating.toString(),
                    style: TextStyles.bold12,
                  ),
                  const Gap(4),
                  Text(
                    '(+${provider.reviewCount})',
                    style: TextStyles.regular12
                        .copyWith(color: AppColors.grey2Color),
                  )
                ],
              ),
              Text(
                provider.description,
                style: TextStyles.light12.copyWith(
                  color: AppColors.grey2Color,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
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
