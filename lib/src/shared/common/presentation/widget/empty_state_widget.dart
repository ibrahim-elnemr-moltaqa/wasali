import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/network_image.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.subText});
  final String image;
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppMedia(
          path: image,
        ),
        Text(
          text,
          style: TextStyles.bold16,
          textAlign: TextAlign.center,
        ),
        const Gap(4),
        Text(
          subText,
          style: TextStyles.regular12.copyWith(color: AppColors.grey2Color),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
