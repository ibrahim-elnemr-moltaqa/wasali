import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/svg_icon.dart';

class ProductDiscountWidget extends StatelessWidget {
  const ProductDiscountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSvgIcon(path: AppIcons.fire),
        const Gap(4),
        const Flexible(
          child: Text(
            'احصل علي خصم 20% على بعض المنتجات',
            style: TextStyles.bold10,
          ),
        )
      ],
    );
  }
}
