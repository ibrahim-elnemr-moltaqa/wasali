import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';

class StoreManagementFloatingActionButton extends StatelessWidget {
  const StoreManagementFloatingActionButton({super.key, required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSvgIcon(
          path: AppIcons.addCircle,
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyles.bold14,
        )
      ],
    )
        .setContainerToView(
          color: AppColors.primary,
          padding: const EdgeInsets.all(12),
          radius: 50,
        ).onTapScaleAnimation(onTap: onTap ?? () {})
        .paddingBottom(16);
  }
}
