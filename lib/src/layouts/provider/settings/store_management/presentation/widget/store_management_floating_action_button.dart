
import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';

class StoreManagementFloatingActionButton extends StatelessWidget {
  const StoreManagementFloatingActionButton({super.key});

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
          appLocalizer.add_new_size,
          style: TextStyles.bold14,
        )
      ],
    )
        .setContainerToView(
          color: AppColors.primary,
          padding: const EdgeInsets.all(12),
          radius: 50,
        )
        .paddingBottom(16);
  }
}
