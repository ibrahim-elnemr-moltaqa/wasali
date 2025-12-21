import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/app_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/client/providers/data/enum/provider_status_enum.dart';
import 'package:wasli/src/shared/common/presentation/widget/toggle_fav_widget.dart';

class ProviderCardWidget extends StatelessWidget {
  const ProviderCardWidget({
    super.key,
    this.status,
  });

  final ProviderStatusEnum? status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppImage(
          path: AppConstants.networkImageTest,
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
                  const Flexible(
                    child: Text(
                      'بابا جونز',
                      style: TextStyles.bold14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Gap(8),
                  Row(children: [
                    CircleAvatar(radius: 2, backgroundColor: status!.color),
                    const Gap(6),
                    Text(
                      status!.title,
                      style: TextStyles.bold12.copyWith(color: status!.color),
                    ),
                    const Gap(4),
                  ]),
                  const Spacer(),
                  const ToggleFavWidget(),
                ],
              ),
              const Gap(4),
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
              Text(
                'متجرنا يقدّم لك تجربة تسوّق سهلة وسريعة، مع مجموعة واسعة من المنتجات عالية الجودة بأسعار تنافسية، وخدمة توصيل موثوقة حتى باب بيتك.',
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
