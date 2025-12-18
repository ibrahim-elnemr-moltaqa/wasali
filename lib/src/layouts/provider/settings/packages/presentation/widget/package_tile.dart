import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';

class PackageTile extends StatelessWidget {
  const PackageTile({
    super.key,
    required this.label,
    this.value,
    this.customValue,
    this.labelStyle,
  });

  final String label;
  final String? value;
  final Widget? customValue;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle ??
              TextStyles.regular12.copyWith(color: AppColors.grey2Color),
        ),
        customValue ??
            Text(
              value ?? '',
              style: TextStyles.bold14,
            ),
      ],
    );
  }
}
