import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  final TileModel tileModel;
  const TileCard({super.key, required this.tileModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tileModel.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.secondary50)),
        child: Row(
          children: [
            AppSvgIcon(path: tileModel.icon),
            const SizedBox(
              width: 4,
            ),
            Expanded(
                child: Text(
              tileModel.title,
              style: TextStyles.light14.copyWith(color: tileModel.color),
            )),
            tileModel.trailing ??
                Transform.rotate(angle: appLocalizer.localeName == 'ar' ? 0 : 180 * 3.14 / 180, child: AppSvgIcon(path: AppIcons.forwardArrowIc)),
          ],
        ),
      ),
    );
  }
}

class TileModel {
  final String title;
  final String icon;
  final void Function()? onTap;
  final Widget? trailing;
  final Color? color;
  final bool needAuth;
  TileModel({
    required this.title,
    required this.icon,
    this.onTap,
    this.color,
    this.trailing,
    this.needAuth = false,
  });
}
