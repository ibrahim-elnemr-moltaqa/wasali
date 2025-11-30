import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/svg_icon.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    super.key,
    this.price,
  });
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          '500',
          style: TextStyles.bold14,
        ),
        const Gap(4),
        AppSvgIcon(path: AppIcons.sar)
      ],
    );
  }
}