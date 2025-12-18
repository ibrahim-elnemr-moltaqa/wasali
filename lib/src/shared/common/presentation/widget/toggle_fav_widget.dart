import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/material/media/svg_icon.dart';

class ToggleFavWidget extends StatefulWidget {
  const ToggleFavWidget({super.key, this.isFavorite = false});
  final bool isFavorite;

  @override
  State<ToggleFavWidget> createState() => _ToggleFavWidgetState();
}

class _ToggleFavWidgetState extends State<ToggleFavWidget> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppSvgIcon(
      path: isFavorite ? AppIcons.fillFav : AppIcons.favIc,
    ).onTapScaleAnimation(onTap: () => toggleFavorite());
  }
}
