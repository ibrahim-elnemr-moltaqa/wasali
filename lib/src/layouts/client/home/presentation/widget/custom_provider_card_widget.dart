import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/network_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';

class CustomProviderCardWidget extends StatelessWidget {
  const CustomProviderCardWidget({
    super.key,
    this.status,
  });

  final ProviderStatusEnum? status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppMedia(
          path: AppConstants.networkImageTest,
          fit: BoxFit.cover,
          width: 108,
          height: 86,
          radius: 8,
        ).setContainerToView(
          color: AppColors.primary,
          radius: 8,
        ),
        const Gap(8),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Text(
                    'بابا جونز',
                    style: TextStyles.bold14,
                  ),
                  if (status != null) ...{
                    const Gap(8),
                    Row(children: [
                      CircleAvatar(radius: 2, backgroundColor: status!.color),
                      const Gap(6),
                      Text(
                        status!.name,
                        style: TextStyles.bold12.copyWith(color: status!.color),
                      ),
                      const Gap(4),
                    ])
                  } else ...{
                    const Spacer(),
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
                  }
                ],
              ),
              const Gap(4),
              if (status != null) ...{
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
              },
              Text(
                'متجرنا يقدّم لك تجربة تسوّق سهلة وسريعة، مع مجموعة واسعة من المنتجات عالية الجودة بأسعار تنافسية، وخدمة توصيل موثوقة حتى باب بيتك.',
                style: TextStyles.light12.copyWith(
                  color: AppColors.grey2Color,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (status == null) ...{
                const Gap(8),
                Row(
                  children: [
                    AppSvgIcon(path: AppIcons.fire),
                    const Gap(4),
                    const Flexible(
                      child: Text(
                        'احصل علي خصم 20% على بعض المنتجات',
                        style: TextStyles.bold10,
                      ),
                    )
                  ],
                )
              }
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
