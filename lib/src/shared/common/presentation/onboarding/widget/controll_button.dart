import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/media/svg_icon.dart';

class ControllsButtons extends StatelessWidget {
  const ControllsButtons({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.onBack,
    required this.onNext,
  });
  final bool isFirst;
  final bool isLast;
  final VoidCallback onBack;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Bounce(
          onTap: onNext,
          child: SizedBox(
            width: 126,
            child: AppButton(
              text: appLocalizer.next,
              buttonColor: AppColors.primary,
              trailing: RotatedBox(
                  quarterTurns: getLocale == const Locale('en') ? 2 : 0,
                  child: AppSvgIcon(path: AppIcons.doubleArrowIc)),
              onPressed: onNext,
            ),
          ),
        ),
        if (!isFirst) ...[
          const SizedBox(
            width: 12,
          ),
          Bounce(
            onTap: onBack,
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: AppColors.primary50,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: RotatedBox(
                    quarterTurns: getLocale == const Locale('en') ? 2 : 0,
                    child: AppSvgIcon(path: AppIcons.doubleArrowIc)),
              ),
            ),
          )
        ]
      ],
    );
  }
}
