import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';

class PageProgressInductor extends StatelessWidget {
  const PageProgressInductor(
      {super.key, required this.currentPage, required this.length});
  final int currentPage;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        final bool isSelected = index == currentPage;
        return AnimatedContainer(
          duration: Durations.medium2,
          height: 3,
          width: 36,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isSelected
                  ? AppColors.primary500
                  : AppColors.disableindicatorColor),
        );
      }),
    );
  }
}
