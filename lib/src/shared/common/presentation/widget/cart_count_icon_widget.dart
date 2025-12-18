import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/media/svg_icon.dart';

class CartCountIconWidget extends StatelessWidget {
  const CartCountIconWidget({
    super.key,  this.padding = 12,
  });
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Badge.count(
            count: 5,
            alignment: AlignmentDirectional.topStart,
            offset: const Offset(8, -4),
            backgroundColor: AppColors.red500,
            textColor: AppColors.warning50,
            child: AppSvgIcon(
              path: AppIcons.bag,
            ))
        .setBorder(
          radius: 12,
          padding: const EdgeInsets.all(10),
        )
        .paddingHorizontal(padding);
  }
}