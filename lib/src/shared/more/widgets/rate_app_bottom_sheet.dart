import 'package:wasli/core/core.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class RateAppBottomSheet extends StatelessWidget {
  const RateAppBottomSheet({super.key});
  static Future<void> show(BuildContext context) async =>
      await showAppModalBottomSheet(
        context: context,
        child: const RateAppBottomSheet(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appLocalizer.shareApp,
          style: TextStyles.regular20,
        ),
        const SizedBox(height: 12),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: appLocalizer.shareAppHint),
            const TextSpan(text: ' '),
            TextSpan(
              text: appLocalizer.via,
              style: TextStyles.light14.copyWith(color: AppColors.primary),
            )
          ]),
          style: TextStyles.light14.copyWith(color: AppColors.secondary800),
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          // padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.secondary100),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "www. example.com",
                    textAlign: TextAlign.end,
                    style: TextStyles.regular14.copyWith(
                        color: AppColors.text3,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
