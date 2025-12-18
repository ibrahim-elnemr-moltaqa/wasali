import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';

class SearchSectionHeader extends StatelessWidget {
  final String title;
  const SearchSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(title, style: TextStyles.bold14),
      ),
    );
  }
}

class SearchChip extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;

  const SearchChip({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSvgIcon(path: icon),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyles.bold12.copyWith(color: AppColors.grey2Color),
        ),
      ],
    )
        .setBorder(
          radius: 12,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        )
        .onTapScaleAnimation(onTap: onTap);
  }
}
