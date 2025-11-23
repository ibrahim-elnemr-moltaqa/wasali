import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/material/media/svg_icon.dart';

class ClientHomeAppbar extends StatelessWidget {
  const ClientHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderColor)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppSvgIcon(path: AppIcons.profile),
            )),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appLocalizer.welcome, style: TextStyles.bold14),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                AppSvgIcon(path: AppIcons.fillLocation),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  appLocalizer.location,
                  style: TextStyles.regular12
                      .copyWith(color: AppColors.grey2Color),
                )
              ],
            )
          ],
        ),
        const Spacer(),
        Row(
          children: [
            AppSvgIcon(path: AppIcons.searchIc),
            const SizedBox(
              width: 12,
            ),
            AppSvgIcon(path: AppIcons.addToCartIc)
          ],
        )
      ],
    );
  }
}
