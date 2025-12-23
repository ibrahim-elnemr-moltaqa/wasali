import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_debounce_search_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/src/layouts/provider/settings/store_management/presentation/widget/management_status_filter_sheet.dart';

class StoreManagementSearchBar extends StatelessWidget {
  const StoreManagementSearchBar({
    super.key,
    this.onFilterTap,
    this.hintText,
    this.onChanged,
    this.onStatusChanged,
    this.currentActive,
  });

  final VoidCallback? onFilterTap;
  final void Function(String)? onChanged;
  final void Function(int?)? onStatusChanged;
  final int? currentActive;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: AppDebounceSearchField(
          hintText: hintText,
          prefixIcon: (focused) => AppSvgIcon(
              path: AppIcons.search,
              color: focused ? AppColors.primary : AppColors.textInputField),
          onChanged: onChanged,
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
            .onTapScaleAnimation(
                onTap: onFilterTap ??
                    () {
                      if (onStatusChanged != null) {
                        ManagementStatusFilterSheet.show(
                          context,
                          onStatusChanged: onStatusChanged!,
                          initialActive: currentActive,
                        );
                      }
                    }),
      ],
    ).paddingTop(20);
  }
}
