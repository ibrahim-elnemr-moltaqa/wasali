import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  final String image;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [Image.asset(image), const Gap(4), Text(title)],
    )
            .setContainerToView(
              color: AppColors.primary50,
              radius: 14,
              borderColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 12),
            )
            .onTapScaleAnimation(onTap: onTap));
  }
}
