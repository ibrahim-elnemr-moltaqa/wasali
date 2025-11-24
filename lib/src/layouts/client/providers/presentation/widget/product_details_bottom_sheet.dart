import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/media/network_image.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/overlay/show_modal_bottom_sheet.dart';

class ProductDetailsBottomSheet extends StatelessWidget {
  const ProductDetailsBottomSheet({super.key});
  static Future<void> show(BuildContext context) async =>
      await showAppModalBottomSheet(
        context: context,
        child: const ProductDetailsBottomSheet(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppMedia(
          path: AppConstants.networkImageTest,
          height: 177,
        ).setContainerToView(
          color: AppColors.primary,
          height: 177,
          width: double.infinity,
          radius: 8,
        ),
        const Gap(12),
        const Text(
          'كريب لحمة',
          style: TextStyles.bold18,
        ),
        const Gap(4),
        Text(
          'كريب محشو بقطع دجاج طرية وجبنة سايحة مع صوص لذيذ.',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.regular12.copyWith(
            color: AppColors.grey2Color,
          ),
        ),
        const Gap(12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
              4,
              (index) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          const Text('XL'),
                          Row(
                            children: [
                              const Text('20'),
                              const Gap(4),
                              AppSvgIcon(path: AppIcons.sar),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Radio(
                            value: index,
                          )
                        ],
                      )
                    ],
                  ).setBorder(
                    radius: 8,
                    padding: const EdgeInsets.all(8),
                  )),
        ).setTitle(title: appLocalizer.sizes, titleStyle: TextStyles.bold14),
        const Gap(16),
        AppTextFormField(
          hintText: appLocalizer.notes,
          label: appLocalizer.addComment,
          showCounter: true,
          maxLength: 50,
        )
      ],
    );
  }
}
