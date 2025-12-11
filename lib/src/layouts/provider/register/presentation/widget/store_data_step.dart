import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasli/core/core.dart';
import 'package:wasli/core/utils/extensions/widget_ext.dart';
import 'package:wasli/material/buttons/app_button.dart';
import 'package:wasli/material/inputs/app_text_form_field.dart';
import 'package:wasli/material/inputs/email_field.dart';
import 'package:wasli/material/inputs/intel_phone/phone_field.dart';
import 'package:wasli/material/inputs/name_field.dart';
import 'package:wasli/material/toast/app_toast.dart';
import 'package:wasli/src/layouts/provider/register/domain/use_case/provider_register_store_data_use_case.dart';
import 'package:wasli/src/layouts/provider/register/presentation/provider_register_cubit/store_data/store_data_cubit.dart';
import 'package:wasli/src/shared/auth/presentation/widgets/dotted_upload_image_widget.dart';
import 'package:wasli/src/shared/common/presentation/drop_downs/drop_down.dart';

class StoreDataStep extends StatefulWidget {
  const StoreDataStep({super.key, required this.onStepSucceeded});
  final ValueChanged<int> onStepSucceeded;

  @override
  State<StoreDataStep> createState() => _StoreDataStepState();
}

class _StoreDataStepState extends State<StoreDataStep> {
  TextEditingController storeNameController = TextEditingController();
  TextEditingController storeEmailController = TextEditingController();
  TextEditingController storeDescriptionController = TextEditingController();
  ValueNotifier<IntelPhoneNumberEntity?> storePhoneNumber = ValueNotifier(null);
  ValueNotifier<int?> categoryId = ValueNotifier(null);
  ValueNotifier<List<int>?> subCategoryId = ValueNotifier(null);
  ValueNotifier<File?> storeImage = ValueNotifier(null);
  ValueNotifier<File?> commercialRegisterImage = ValueNotifier(null);

  GlobalKey<FormState> secondStepFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    storeNameController.dispose();
    storeEmailController.dispose();
    storeDescriptionController.dispose();
    storePhoneNumber.dispose();
    categoryId.dispose();
    subCategoryId.dispose();
    storeImage.dispose();
    commercialRegisterImage.dispose();
    super.dispose();
  }

  void onRegisterStoreData(BuildContext context) {
    if (secondStepFormKey.currentState?.validate() ?? false) {
      final params = StoreDataParams(
        image: storeImage.value!,
        name: storeNameController.text,
        phone: storePhoneNumber.value!.number,
        email: storeEmailController.text,
        description: storeDescriptionController.text,
        categoryId: categoryId.value!,
        subCategoryId: subCategoryId.value!,
        commercialImage: commercialRegisterImage.value!,
      );
      context.read<StoreDataCubit>().registerStoreData(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreDataCubit(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          key: secondStepFormKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: storeImage,
                    builder: (context, value, child) {
                      return DottedUploadImageWidget(
                          title: appLocalizer.store_image,
                          onChanged: (image) {
                            storeImage.value = image;
                          });
                    }),
                const SizedBox(height: 12),
                NameField(
                  label: appLocalizer.store_name,
                  hint: appLocalizer.store_name,
                  controller: storeNameController,
                ),
                ValueListenableBuilder(
                    valueListenable: storePhoneNumber,
                    builder: (context, value, child) {
                      return IntelPhoneField(
                        initialValue: storePhoneNumber.value,
                        label: appLocalizer.phoneNumber,
                        onChange: (storePhoneNumber) {
                          this.storePhoneNumber.value = storePhoneNumber;
                        },
                        hint: appLocalizer.enterPhoneNumber,
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
                          title: appLocalizer.commercial_register_image,
                          onChanged: (image) {
                            commercialRegisterImage.value = image;
                          });
                    }),
                ValueListenableBuilder(
                    valueListenable: categoryId,
                    builder: (context, value, child) {
                      return AppSingleDropDown<int>(
                        value: null,
                        itemDisplay: (itemDisplay) => itemDisplay.toString(),
                        items: const [1, 2, 3, 4, 5],
                        onChanged: (value) {
                          categoryId.value = value;
                        },
                        borderRadius: 10,
                        title: appLocalizer.main_category,
                        hint: appLocalizer.choose_main_category,
                      );
                    }),
                ValueListenableBuilder(
                    valueListenable: subCategoryId,
                    builder: (context, value, child) {
                      return AppMultiDropDown<int>(
                        value: [],
                        itemDisplay: (itemDisplay) => itemDisplay.toString(),
                        items: const [1, 2, 3, 4, 5],
                        onChanged: (value) {
                          subCategoryId.value = value;
                        },
                        title: appLocalizer.sub_category,
                        hint: appLocalizer.choose_sub_category,
                      );
                    }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<StoreDataCubit, Async>(
          listener: (context, state) {
            if (state.isSuccess) {
              widget.onStepSucceeded(2);
            } else if (state.isFailure) {
              AppToasts.error(context, message: state.errorMessage ?? '');
            }
          },
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppButton(
                    isLoading: state.isLoading,
                    text: appLocalizer.next,
                    onPressed: () {
                      onRegisterStoreData(context);
                    }).paddingBottom(16),
              ],
            );
          },
        ),
      ),
    );
  }
}
