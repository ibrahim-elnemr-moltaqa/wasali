import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/svg_icon.dart';

class StoreManagementSearchBar extends StatelessWidget {
  const StoreManagementSearchBar({
    super.key,
    this.onFilterTap,
    this.hintText,
  });

  final VoidCallback? onFilterTap;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AppTextFormField(
          hintText: hintText,
          prefixIcon: (isFocused) => AppSvgIcon(
            path: AppIcons.search,
            color: isFocused ? AppColors.primary : AppColors.hintColor,
          ),
        )),
        const SizedBox(width: 8),
        AppSvgIcon(
          path: AppIcons.filter,
        )
            .setContainerToView(
              color: AppColors.primary,
              padding: const EdgeInsets.all(8),
              radius: 12,
            )
            .onTapScaleAnimation(onTap: onFilterTap ?? () {}),
      ],
    );
  }
}
