import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.onSkip});
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSkip,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          appLocalizer.skip,
          style: TextStyles.regular14.copyWith(color: AppColors.text2),
        ),
      ),
    );
  }
}