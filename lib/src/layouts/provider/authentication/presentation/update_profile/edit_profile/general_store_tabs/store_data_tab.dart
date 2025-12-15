import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/email_field.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/common/domain/entity/categroy_entity.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/main_categories/main_categories_drop_down.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/sub_categories/sub_categories_drop_down.dart';

class StoreDataTab extends StatefulWidget {
  const StoreDataTab({super.key, this.storeDataEntity});
  final StoreDataEntity? storeDataEntity;

  @override
  State<StoreDataTab> createState() => _StoreDataTabState();
}

class _StoreDataTabState extends State<StoreDataTab> {
  late TextEditingController storeNameController;
  late TextEditingController storeEmailController;
  late TextEditingController storeDescriptionController;
  late List<IntelPhoneNumberEntity> storePhoneNumber;
  CategoryEntity? category;
  List<CategoryEntity> subCategories = [];
  ValueNotifier<File?> storeImage = ValueNotifier(null);
  ValueNotifier<File?> commercialRegisterImage = ValueNotifier(null);
  String? initialStoreImage;
  String? initialCommercialRegisterImage;

  @override
  void initState() {
    super.initState();

    storeNameController =
        TextEditingController(text: widget.storeDataEntity?.name ?? '');
    storeEmailController =
        TextEditingController(text: widget.storeDataEntity?.email ?? '');
    storeDescriptionController =
        TextEditingController(text: widget.storeDataEntity?.description ?? '');

    storePhoneNumber = widget.storeDataEntity?.phones
            .map((storePhone) {
              try {
                return IntelPhoneNumberEntity.fromCompleteNumber(
                  completeNumber: storePhone.phone,
                );
              } catch (e) {
                debugPrint(
                    'Error parsing phone number: ${storePhone.phone}, Error: $e');
                return null;
              }
            })
            .where((phone) => phone != null)
            .cast<IntelPhoneNumberEntity>()
            .toList() ??
        [];
    log(storePhoneNumber.toString());
    category = widget.storeDataEntity?.category;
    subCategories = widget.storeDataEntity?.subCategories ?? [];
    initialStoreImage = widget.storeDataEntity?.image;
    initialCommercialRegisterImage = widget.storeDataEntity?.commercialRegister;
  }

  @override
  void dispose() {
    storeNameController.dispose();
    storeEmailController.dispose();
    storeDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            DottedUploadImageWidget(
                initialValue: initialStoreImage,
                title: appLocalizer.store_image,
                onChanged: (image) {
                  storeImage.value = image;
                }),
            const SizedBox(height: 12),
            NameField(
              label: appLocalizer.store_name,
              hint: appLocalizer.store_name,
              controller: storeNameController,
            ),
            IntelPhoneField(
              initialValue: storePhoneNumber.firstOrNull,
              label: appLocalizer.phoneNumber,
              onChange: (storePhoneNumber) {},
              hint: appLocalizer.enterPhoneNumber,
            ),
            EmailField(controller: storeEmailController),
            AppTextFormField(
              label: appLocalizer.store_description,
              hintText: appLocalizer.store_description,
              controller: storeDescriptionController,
              maxLines: 5,
              maxLength: 300,
              showCounter: true,
              validate: (text) => Validator(text).defaultValidator,
            ),
            ValueListenableBuilder(
                valueListenable: commercialRegisterImage,
                builder: (context, value, child) {
                  return DottedUploadImageWidget(
                      initialValue: initialCommercialRegisterImage,
                      title: appLocalizer.commercial_register_image,
                      onChanged: (image) {
                        commercialRegisterImage.value = image;
                      });
                }),
            MainCategoriesDropDown(
              onChanged: (value) {
                category = value;
              },
            ),
            SubCategoriesDropDown(
              onChanged: (value) {
                subCategories = value ?? [];
              },
            ),
            const SizedBox(height: 20),
            AppButton(
              text: appLocalizer.edit,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
          ],
        ).paddingHorizontal(20),
      ),
    );
  }
}
