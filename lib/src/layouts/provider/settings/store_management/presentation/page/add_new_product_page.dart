import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class AddNewProductPage extends StatelessWidget {
  const AddNewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(appLocalizer.add_new_product),
          centerTitle: false,
          leading: const BackButton()
              .setBorder(
                radius: 12,
              )
              .paddingAll(8)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(24),
            NameField(
              label: appLocalizer.product_name,
              hint: appLocalizer.enter_product_name,
            ),
            AppTextFormField(
              label: appLocalizer.product_description,
              hintText: appLocalizer.product_description,
              showCounter: true,
              maxLength: 50,
            ),
            AppSingleDropDown(
              value: null,
              itemDisplay: (itemDisplay) => itemDisplay,
              items: const [
                'section1',
                'section2',
                'section3',
                'section4',
                'section5'
              ],
              hint: appLocalizer.select_section,
              borderRadius: 12,
              title: appLocalizer.section,
            ),
            AppSingleDropDown(
              value: null,
              itemDisplay: (itemDisplay) => itemDisplay,
              items: const ['size1', 'size2', 'size3', 'size4', 'size5'],
              hint: appLocalizer.select_size,
              borderRadius: 12,
              title: appLocalizer.size,
            ),
            NameField(
              label: appLocalizer.product_price,
              hint: appLocalizer.enter_product_price,
            ),
            const Gap(8),
            DottedUploadImageWidget(
              title: appLocalizer.product_image,
              onChanged: (file) {},
            ).setTitle(
              title: appLocalizer.product_image,
            ),
            const Gap(8),
            DottedUploadImageWidget(
              title: appLocalizer.additional_image,
              onChanged: (file) {},
            ).setTitle(
              title: appLocalizer.additional_image,
            ),
            const Gap(24),
            AppButton(text: appLocalizer.save, onPressed: () {}),
            const Gap(24),
          ],
        ).paddingHorizontal(20).withSafeArea(),
      ),
    );
  }
}
