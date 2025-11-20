import 'package:flutter/material.dart';
import 'package:wasli/material/spin_kit_loading_widget.dart';

import '../../core/core.dart';

class AppDropdownSingleSelect<T> extends StatelessWidget {
  final String? title;
  final TextStyle? titleStyle;
  final String? hint;
  final T? selectedValue;
  final bool enabled;
  final String? Function(T? value)? validator;

  final Color? fillColor;
  final List<T> items;
  final void Function(T? value)? onChanged;
  final String Function(T displayValue) itemDisplay;

  final Widget? prefixIcon;
  final bool isLoading;
  final bool isFailer;
  final bool isOptional;
  final double titlePadding;

  final bool showClearButton;
  final VoidCallback? onClear;
  final DropdownMenuItemStyle? dropdownMenuStyle;

  const AppDropdownSingleSelect({
    super.key,
    this.title,
    this.selectedValue,
    this.hint,
    this.enabled = true,
    required this.items,
    this.onChanged,
    required this.itemDisplay,
    this.prefixIcon,
    this.fillColor,
    this.validator,
    this.titleStyle,
    this.isLoading = false,
    this.isFailer = false,
    this.isOptional = false,
    this.showClearButton = false,
    this.onClear,
    this.titlePadding = 8,
    this.dropdownMenuStyle,
  });

  @override
  Widget build(BuildContext context) {
    T? selectedItem = items.cast<T?>().firstWhere(
          (value) => value == selectedValue,
          orElse: () => null,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.only(bottom: titlePadding),
            child: Text.rich(
              TextSpan(
                text: title,
                style: titleStyle ?? TextStyles.regular16,
                children: [
                  if (!isOptional)
                    TextSpan(
                      text: ' *',
                      style: (titleStyle ?? TextStyles.regular12)
                          .copyWith(color: AppColors.error),
                    ),
                ],
              ),
            ),
          ),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            DropdownButtonFormField<T>(
              value: selectedItem,
              validator: validator,
              menuMaxHeight: MediaQuery.of(context).size.height * .85,
              decoration: InputDecoration(
                fillColor: fillColor,
                filled: fillColor != null,
                prefixIcon: _buildPrefixIcon(),
                enabled: enabled,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
              hint: Text(
                hint ?? title ?? '',
                style: TextStyles.regular12.copyWith(
                  color: AppColors.greyColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              icon: _getSuffixWidget,
              iconSize: 20,
              elevation: 1,
              onChanged: enabled ? onChanged : null,
              isExpanded: true,

              // Selected item widget
              selectedItemBuilder: (context) {
                return items.map((T value) {
                  return Text(
                    itemDisplay(value),
                    style: TextStyles.regular16,
                    overflow: TextOverflow.ellipsis,
                  );
                }).toList();
              },

              // Dropdown menu items
              items: items.isEmpty
                  ? null
                  : items.map((T value) {
                      final bool isSelected = value == selectedItem;
                      return DropdownMenuItem<T>(
                        value: value,
                        child: Text(
                          itemDisplay(value),
                          style: isSelected
                              ? TextStyles.bold14
                              : TextStyles.regular14,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
            ),

            // Clear selection icon
            if (showClearButton &&
                selectedItem != null &&
                enabled &&
                !isLoading)
              Positioned(
                right: 36,
                child: GestureDetector(
                  onTap: onClear,
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  /// Prefix Icon Wrapper
  Widget? _buildPrefixIcon() {
    if (prefixIcon == null) return null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
      child: UnconstrainedBox(child: prefixIcon),
    );
  }

  /// Suffix icon logic (loading, error, normal)
  Widget get _getSuffixWidget {
    if (isFailer) {
      return const Icon(
        Icons.info_outline,
        color: Colors.red,
        size: 20,
      );
    } else if (isLoading) {
      return const SpinKitLoadingWidget(size: 20);
    } else {
      return Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.primary300,
        size: 20,
      );
    }
  }
}

/// Optional dropdown style config
class DropdownMenuItemStyle {
  final double height;
  final EdgeInsets padding;

  const DropdownMenuItemStyle({
    this.height = 50,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
  });
}
