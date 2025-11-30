import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/shared/common/data/models/more_tile_model.dart';

class TileCard extends StatelessWidget {
  final MoreTileModel tileModel;
  const TileCard({super.key, required this.tileModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSvgIcon(
          path: tileModel.icon,
          color: tileModel.color,
        ).setBorder(
          radius: 12,
          padding: const EdgeInsets.all(8),
          color: AppColors.borderColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
            child: Text(
          tileModel.title,
          style: TextStyles.bold12.copyWith(color: tileModel.color),
        )),
        tileModel.trailing ??
            AppSvgIcon(
              path: AppIcons.forwardArrowIc,
            ).withRotatedBox(),
      ],
    )
        .zoomIn()
        .paddingBottom(20)
        .onTapScaleAnimation(onTap: tileModel.onTap ?? () {});
  }
}
