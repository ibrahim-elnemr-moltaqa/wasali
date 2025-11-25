import 'package:flutter/material.dart';
import 'package:wasli/core/config/router/app_routes.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/network_image.dart';
import 'package:wasli/material/media/svg_icon.dart';

class MoreAppBarWidget extends StatelessWidget {
  const MoreAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppMedia(
            path: AppConstants.networkImageTest,
            fit: BoxFit.cover,
            width: 48,
            height: 48,
            radius: 8),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('راكان فيصل المطيري', style: TextStyles.bold14),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                AppSvgIcon(
                  path: AppIcons.flag,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'السعودية',
                  style: TextStyles.regular12
                      .copyWith(color: AppColors.grey2Color),
                ),
                const SizedBox(
                  width: 4,
                ),
                AppSvgIcon(
                  path: AppIcons.arrowDownIc,
                ),
              ],
            ).onTapScaleAnimation(onTap: () {})
          ],
        ),
        const Spacer(),
        AppSvgIcon(
          path: AppIcons.settingsIc,
          size: 24,
        )
            .setBorder(
          radius: 12,
          padding: const EdgeInsets.all(8),
          color: AppColors.borderColor,
        )
            .onTapScaleAnimation(onTap: () {
          AppRouter.pushNamed(AppRoutes.settingsPage);
        })
      ],
    );
  }
}
