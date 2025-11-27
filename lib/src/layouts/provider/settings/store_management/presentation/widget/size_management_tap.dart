import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/svg_icon.dart';

class SizeManagementTap extends StatelessWidget {
  const SizeManagementTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: AppTextFormField(
              hintText: appLocalizer.size_name,
              prefixIcon: (isFocused) => AppSvgIcon(
                path: AppIcons.search,
                color: isFocused ? AppColors.primary : AppColors.hintColor,
              ),
            )),
            const SizedBox(width: 8),
            AppSvgIcon(
              path: AppIcons.filter,
            ).setContainerToView(
              color: AppColors.primary,
              padding: const EdgeInsets.all(8),
              radius: 12,
            ),
          ],
        ),
        const Gap(24),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        appLocalizer.size,
                        style: TextStyles.regular12,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            appLocalizer.active,
                            style: TextStyles.bold12
                                .copyWith(color: AppColors.success600),
                          ),
                          Icon(
                            Icons.more_vert,
                            color: AppColors.greyColor,
                          )
                        ],
                      )
                    ],
                  ),
                  const Gap(4),
                  const Text('S', style: TextStyles.bold12),
                ],
              ).setBorder(
                radius: 12,
                padding: const EdgeInsets.all(12),
              );
            },
            separatorBuilder: (context, index) => const Gap(16),
            itemCount: 5,
          ),
        )
      ],
    );
  }
}
