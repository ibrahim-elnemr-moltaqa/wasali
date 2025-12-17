import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/animated/top_scale_animation.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/email_field.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/media/svg_icon.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/entity/provider_entity.dart';
import 'package:wasli/src/layouts/provider/authentication/domain/use_case/provider_register_store_data_use_case.dart';
import 'package:wasli/src/layouts/provider/authentication/presentation/provider_authentication_cubit/store_data/store_data_cubit.dart';
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
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeEmailController = TextEditingController();
  TextEditingController storeDescriptionController = TextEditingController();
  late List<IntelPhoneNumberEntity> storePhoneNumber;
  ValueNotifier<CategoryEntity?> category = ValueNotifier(null);
  ValueNotifier<List<CategoryEntity>> subCategories = ValueNotifier([]);
  ValueNotifier<File?> storeImage = ValueNotifier(null);
  ValueNotifier<File?> commercialRegisterImage = ValueNotifier(null);
  String? initialStoreImage;
  String? initialCommercialRegisterImage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    storeNameController.text = widget.storeDataEntity?.name ?? '';
    storeEmailController.text = widget.storeDataEntity?.email ?? '';
    storeDescriptionController.text = widget.storeDataEntity?.description ?? '';
    storePhoneNumber = widget.storeDataEntity?.phones
            .map((storePhone) {
              try {
                return IntelPhoneNumberEntity.fromCompleteNumber(
                  completeNumber:
                      storePhone.phone.replaceFirstCharWithCountryCode('+966'),
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
    category.value = widget.storeDataEntity?.category;
    subCategories.value = widget.storeDataEntity?.subCategories ?? [];
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

  void onUpdateStoreData(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      log(storePhoneNumber.toString());
      final params = StoreDataParams(
          image: storeImage.value,
          name: storeNameController.text,
          phones: storePhoneNumber.map((e) => e.number).toList(),
          email: storeEmailController.text,
          description: storeDescriptionController.text,
          categoryId: category.value?.id,
          subCategoryIds: subCategories.value.map((e) => e.id).toList(),
          commercialImage: commercialRegisterImage.value,
          isUpdate: true);
      context.read<StoreDataCubit>().providerStoreData(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreDataCubit(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                ...List.generate(storePhoneNumber.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: IntelPhoneField(
                            initialValue: storePhoneNumber[index],
                            label: appLocalizer.phoneNumber,
                            onChange: (phoneNumber) {
                              storePhoneNumber[index] = phoneNumber;
                            },
                            hint: appLocalizer.enterPhoneNumber,
                          ),
                        ),
                        Visibility(
                          visible: storePhoneNumber.length - 1 == index,
                          child: AppSvgIcon(
                            path: AppIcons.plus,
                            height: 14,
                          )
                              .onTapScaleAnimation(onTap: () {
                                setState(() {
                                  storePhoneNumber.add(
                                    IntelPhoneNumberEntity.fromCompleteNumber(
                                      completeNumber: '+966',
                                    ),
                                  );
                                });
                              })
                              .setBorder(
                                  padding: const EdgeInsets.all(12), radius: 14)
                              .paddingStart(8)
                              .paddingTop(22),
                        ),
                        Visibility(
                          visible: storePhoneNumber.length > 1,
                          child: AppSvgIcon(
                            path: AppIcons.delete,
                            height: 14,
                          )
                              .onTapScaleAnimation(onTap: () {
                                setState(() {
                                  storePhoneNumber.removeAt(index);
                                });
                              })
                              .setBorder(
                                  padding: const EdgeInsets.all(12), radius: 14)
                              .paddingStart(8)
                              .paddingTop(22),
                        )
                      ],
                    ),
                  );
                }),
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
                ValueListenableBuilder(
                    valueListenable: category,
                    builder: (context, value, child) {
                      return MainCategoriesDropDown(
                        category: category.value,
                        onChanged: (value) {
                          category.value = value;
                        },
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: subCategories,
                    builder: (context, value, child) {
                      return SubCategoriesDropDown(
                        subCategories: subCategories.value,
                        onChanged: (value) {
                          subCategories.value = value ?? [];
                        },
                      );
                    }),
                const SizedBox(height: 20),
                BlocConsumer<StoreDataCubit, Async>(
                  listener: (context, state) {
                    if (state.isFailure) {
                      AppToasts.error(context,
                          message: state.errorMessage ?? '');
                    } else if (state.isSuccess) {
                      AppToasts.success(context,
                          message: appLocalizer.profileUpdateSuccessMessage);
                    }
                  },
                  builder: (context, state) {
                    return AppButton(
                      isLoading: state.isLoading,
                      text: appLocalizer.edit,
                      onPressed: () {
                        onUpdateStoreData(context);
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),
              ],
            ).paddingHorizontal(20),
          ),
        ),
      ),
    );
  }
}
